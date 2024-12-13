//
//  PropertyDetailViewModel.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

@MainActor
class PropertyDetailViewModel: ObservableObject {
    @Published private(set) var property: PropertyDetail?
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?

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
        defer { isLoading = false }
        isLoading = true
        error = nil

        do {
            property = try await repository.fetchPropertyDetail(id: propertyId)
        } catch {
            self.error = error
        }
    }
}
