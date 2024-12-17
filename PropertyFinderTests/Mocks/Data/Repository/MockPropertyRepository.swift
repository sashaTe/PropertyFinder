//
//  MockPropertyRepository.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import Foundation
@testable import PropertyFinder

/// A mock implementation of PropertyRepositoryProtocol for testing purposes
final class MockPropertyRepository: PropertyRepositoryProtocol {
    /// Mock properties to be returned by fetchProperties
    var mockProperties: [Property] = []

    /// Mock property detail to be returned by fetchPropertyDetail
    var mockPropertyDetail: PropertyDetail?

    /// Mock error to be thrown by repository methods
    var mockError: Error?

    /// Simulates fetching properties from repository
    func fetchProperties(cityId: Int) async throws -> [Property] {
        if let error = mockError {
            throw error
        }
        return mockProperties
    }

    /// Simulates fetching property detail from repository
    func fetchPropertyDetail(id: String) async throws -> PropertyDetail {
        if let error = mockError {
            throw error
        }
        guard let propertyDetail = mockPropertyDetail else {
            throw NetworkError.invalidResponse
        }

        return propertyDetail
    }
}
