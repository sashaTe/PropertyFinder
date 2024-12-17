//
//  PropertyDetailViewModel.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

@MainActor
class PropertyDetailViewModel: ObservableObject {
    @Published private(set) var state: ViewState<PropertyDetail> = .loading
    private let propertyId: String
    private let repository: PropertyRepositoryProtocol

    init(
        propertyId: String,
        repository: PropertyRepositoryProtocol
    ) {

        self.propertyId = propertyId
        self.repository = repository
    }

    func fetchPropertyDetail() async {
        state = .loading

        do {
            let property = try await repository.fetchPropertyDetail(id: propertyId)
            state = .loaded(property)
        } catch {
            state = .error(error)
        }
    }
}
