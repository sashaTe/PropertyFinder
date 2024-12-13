//
//  MockNetworkService.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import Foundation
@testable import PropertyFinder

final class MockNetworkService: NetworkServiceProtocol {
    private(set) var fetchCallCount = 0
    var mockResponse: Any?
    var mockError: Error?

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
