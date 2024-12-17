//
//  PropertyRepositoryProtocol.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 10.12.2024.
//

import Foundation

/// Repository interface for accessing property data
protocol PropertyRepositoryProtocol {
    /// Fetches properties for specified city
    /// - Parameter cityId: ID of the city to fetch properties for
    /// - Returns: Array of Property objects
    /// - Throws: Network or parsing errors
    func fetchProperties(cityId: Int) async throws -> [Property]

    /// Fetches detailed information for a specific property
    /// - Parameter id: Property identifier
    /// - Returns: PropertyDetail object
    /// - Throws: Network or parsing errors
    func fetchPropertyDetail(id: String) async throws -> PropertyDetail
}
