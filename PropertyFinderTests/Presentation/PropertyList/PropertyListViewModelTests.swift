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

    /// Tests initial state is loading
    func testInitialState_IsLoading() {
        XCTAssertEqual(sut.state, .loading)
    }

    /// Tests successful properties fetch with data
    func testFetchProperties_Success() async {
        // Given
        let expectedProperties = [Property.mock()]
        mockRepository.mockProperties = expectedProperties

        // When
        await sut.fetchProperties()

        // Then
        XCTAssertEqual(sut.state, .loaded(expectedProperties))
    }

    /// Tests successful properties fetch with empty result
    func testFetchProperties_EmptyResult() async {
        // Given
        mockRepository.mockProperties = []

        // When
        await sut.fetchProperties()

        // Then
        XCTAssertEqual(sut.state, .empty)
    }

    /// Tests error handling during properties fetch
    func testFetchProperties_Error() async {
        // Given
        let expectedError = NetworkError.serverError(500)
        mockRepository.mockError = expectedError

        // When
        await sut.fetchProperties()

        // Then
        XCTAssertEqual(sut.state, .error(expectedError))
    }

    /// Tests state transitions during properties fetch
    func testFetchProperties_StateTransitions() async {
        // Given
        let expectedProperties = [Property.mock()]
        mockRepository.mockProperties = expectedProperties

        // When & Then
        XCTAssertEqual(sut.state, .loading) // Initial state

        await sut.fetchProperties()

        XCTAssertEqual(sut.state, .loaded(expectedProperties)) // Final state
    }
}
