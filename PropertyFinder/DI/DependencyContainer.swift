//
//  DependecyContainer.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 11.12.2024.
//

import Foundation


final class DependencyContainer: DependencyContainerProtocol {
    let repository: PropertyRepositoryProtocol
//    let navigationCoordinator: DefaultNavigationCoordinator

    @MainActor
    init() {
        let networkService = NetworkService()
//        let cache = PropertyCache()

        self.repository = PropertyRepository(networkService: networkService)

//        self.navigationCoordinator = DefaultNavigationCoordinator()
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
