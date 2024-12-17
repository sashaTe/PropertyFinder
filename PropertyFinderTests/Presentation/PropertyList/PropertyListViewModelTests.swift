//
//  PropertyListViewModelTests.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import XCTest
@testable import PropertyFinder

@MainActor
final class PropertyListViewModelTests: XCTestCase {
    var sut: PropertyListViewModel!
    var mockRepository: MockPropertyRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockPropertyRepository()
        sut = PropertyListViewModel(repository: mockRepository)
    }

    override func tearDown() {
        sut = nil
        mockRepository = nil
        super.tearDown()
    }

    /// Tests successful properties fetch
    func testFetchProperties_Success() async {
        // Given
        let expectedProperties = [Property.mock()]
        mockRepository.mockProperties = expectedProperties

        // When
        await sut.fetchProperties()

        // Then
        XCTAssertEqual(sut.properties, expectedProperties)
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.error)
    }

    /// Tests error handling during properties fetch
    func testFetchProperties_Error() async {
        // Given
        mockRepository.mockError = NetworkError.serverError(500)

        // When
        await sut.fetchProperties()

        // Then
        XCTAssertTrue(sut.properties.isEmpty)
        XCTAssertFalse(sut.isLoading)
        XCTAssertNotNil(sut.error)
    }

    /// Tests loading state during properties fetch
    func testFetchProperties_LoadingState() async {
        // Given
        let expectedProperties = [Property.mock()]
        mockRepository.mockProperties = expectedProperties

        // When
        let task = Task {
            XCTAssertFalse(sut.isLoading)
            await sut.fetchProperties()
            
        // Then
            XCTAssertFalse(sut.isLoading)
        }

        await task.value
    }
}
