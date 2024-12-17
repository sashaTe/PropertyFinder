//
//  PropertyRepository.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 10.12.2024.
//

import Foundation

/// Implementation of PropertyRepositoryProtocol that works with network service
final class PropertyRepository: PropertyRepositoryProtocol {
    private let networkService: NetworkServiceProtocol

    init(
        networkService: NetworkServiceProtocol
    ) {
        self.networkService = networkService
    }

    func fetchProperties(cityId: Int) async throws -> [Property] {
        let dto: PropertyListResponseDTO = try await networkService.fetch(from: .cityProperties(cityId: cityId))
        let properties = dto.properties.map { Property(dto: $0)}

        return properties
    }

    func fetchPropertyDetail(id: String) async throws -> PropertyDetail {
        let dto: PropertyDetailDTO = try await networkService.fetch(from: .propertyDetail(id: id))
        let property = PropertyDetail(dto: dto)

        return property
    }

}
