//
//  MockPropertyRepository.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import Foundation
@testable import PropertyFinder

final class MockPropertyRepository: PropertyRepositoryProtocol {
    var mockProperties: [Property] = []
    var mockPropertyDetail: PropertyDetail?
    var mockError: Error?

    func fetchProperties(cityId: Int) async throws -> [Property] {
        if let error = mockError {
            throw error
        }
        return mockProperties
    }

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
