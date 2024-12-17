//
//  MockNetworkService.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import Foundation
@testable import PropertyFinder

/// A mock implementation of NetworkServiceProtocol for testing purposes
final class MockNetworkService: NetworkServiceProtocol {
    /// Counts how many times fetch method was called
    private(set) var fetchCallCount = 0

    /// Mock response to be returned by the fetch method
    var mockResponse: Any?

    /// Mock error to be thrown by the fetch method
    var mockError: Error?

    /// Simulates network request by returning mock data or throwing mock error
    func fetch<T>(from endpoint: Endpoint) async throws -> T where T : Decodable {
        fetchCallCount += 1

        if let error = mockError {
            throw error
        }

        guard let response = mockResponse as? T else {
            throw NetworkError.invalidResponse
        }

        return response
    }
}
