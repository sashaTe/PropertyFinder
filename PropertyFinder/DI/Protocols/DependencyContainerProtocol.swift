//
//  DependecyContainerProtocol.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 11.12.2024.
//

import Foundation

/// The dependency container used to create view models and other dependencies.
protocol DependencyContainerProtocol {
    var repository: PropertyRepositoryProtocol { get }
//    var navigationCoordinator: DefaultNavigationCoordinator{ get }

    @MainActor func makePropertyListViewModel() -> PropertyListViewModel
    @MainActor func makePropertyDetailViewModel(propertyId: String) -> PropertyDetailViewModel
}
