//
//  DependecyContainer.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 11.12.2024.
//

import Foundation

/// Main dependency container implementation that manages app-wide dependencies
final class DependencyContainer: DependencyContainerProtocol {
    /// Shared repository instance for accessing property data
    let repository: PropertyRepositoryProtocol

    @MainActor
    init() {
        let networkService = NetworkService()

        self.repository = PropertyRepository(networkService: networkService)
    }

    @MainActor func makePropertyListViewModel() -> PropertyListViewModel {
        PropertyListViewModel(repository: repository)
    }

    @MainActor func makePropertyDetailViewModel(propertyId: String) -> PropertyDetailViewModel {
        PropertyDetailViewModel(
            propertyId: propertyId,
            repository: repository
        )
    }
}
