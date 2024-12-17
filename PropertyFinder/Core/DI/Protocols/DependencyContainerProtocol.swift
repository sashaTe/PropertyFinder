//
//  DependecyContainerProtocol.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 11.12.2024.
//

import Foundation

/// Protocol defining the interface for dependency container
/// Provides access to shared dependencies and factory methods for view models
protocol DependencyContainerProtocol {
    /// Shared repository instance for accessing property data
    var repository: PropertyRepositoryProtocol { get }

    /// Creates a new PropertyListViewModel instance
    /// - Returns: Configured view model for property list screen
    @MainActor func makePropertyListViewModel() -> PropertyListViewModel

    /// Creates a new PropertyDetailViewModel instance
    /// - Parameter propertyId: ID of the property to display
    /// - Returns: Configured view model for property detail screen
    @MainActor func makePropertyDetailViewModel(propertyId: String) -> PropertyDetailViewModel
}
