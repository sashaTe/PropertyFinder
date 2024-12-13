//
//  PropertyRepositoryTests.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 13.12.2024.
//

import XCTest
@testable import PropertyFinder

final class PropertyRepositoryTests: XCTestCase {
    var sut: PropertyRepository!
    var mockNetworkService: MockNetworkService!

    override func setUp(){
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = PropertyRepository(networkService: mockNetworkService)
    }

    override func tearDown(){
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }

    // MARK: - Fetch Properties Tests

    func testFetchProperties_Success() async throws {
        // Given
        let dto = PropertyListResponseDTO(properties: [PropertyListItemDTO.mock()])
        mockNetworkService.mockResponse = dto

        // When
        let result = try await sut.fetchProperties(cityId: 1530)

        // Then
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.id, "123")
        XCTAssertEqual(mockNetworkService.fetchCallCount, 1)
    }

    func testFetchProperties_NetworkError() async {
        // Given
        mockNetworkService.mockError = NetworkError.invalidResponse

        // When/Then
        do {
            _ = try await sut.fetchProperties(cityId: 1530)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? NetworkError, .invalidResponse)
            XCTAssertEqual(mockNetworkService.fetchCallCount, 1)
        }
    }

    // MARK: - Fetch Property Detail Tests

    func testFetchPropertyDetail_Success() async throws {
        // Given
        let dto = PropertyDetailDTO.mock()
        mockNetworkService.mockResponse = dto

        // When
        let result = try await sut.fetchPropertyDetail(id: "123")

        // Then
        XCTAssertEqual(result.id, "123")
        XCTAssertEqual(result.name, "Test Property")
        XCTAssertEqual(mockNetworkService.fetchCallCount, 1)
    }

    func testFetchPropertyDetail_NetworkError() async {
        // Given
        mockNetworkService.mockError = NetworkError.serverError(500)

        // When/Then
        do {
            _ = try await sut.fetchPropertyDetail(id: "123")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? NetworkError, .serverError(500))
            XCTAssertEqual(mockNetworkService.fetchCallCount, 1)
        }
    }
}

