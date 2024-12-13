//
//  PropertyRepository.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 10.12.2024.
//

import Foundation

final class PropertyRepository: PropertyRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
//    private let cache: PropertyCache

    init(
        networkService: NetworkServiceProtocol
//        cache: PropertyCache
    ) {
        self.networkService = networkService
//        self.cache = cache
    }

    func fetchProperties(cityId: Int) async throws -> [Property] {
//        if let cachedProperties = await cache.getCachedProperties(forCityId: cityId) {
//            return cachedProperties
//        }

        let dto: PropertyListResponseDTO = try await networkService.fetch(from: .cityProperties(cityId: cityId))
        let properties = dto.properties.map { Property(dto: $0)}

//        await cache.cacheProperties(properties, forCityId: cityId)

        return properties
    }

    func fetchPropertyDetail(id: String) async throws -> PropertyDetail {
//        if let cachedProperty = await cache.getCachedPropertyDetail(id: id) {
//            return cachedProperty
//        }

        let dto: PropertyDetailDTO = try await networkService.fetch(from: .propertyDetail(id: id))
        let property = PropertyDetail(dto: dto)

//        await cache.cachePropertyDetail(property)

        return property
    }

}
