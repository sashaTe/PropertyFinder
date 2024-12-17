//
//  PropertyDetailViewModelTests.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import XCTest
@testable import PropertyFinder

@MainActor
final class PropertyDetailViewModelTests: XCTestCase {
    var sut: PropertyDetailViewModel!
    var mockRepository: MockPropertyRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockPropertyRepository()
        sut = PropertyDetailViewModel(propertyId: "123", repository: mockRepository)
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

    /// Tests successful property detail fetch
    func testFetchPropertyDetail_Success() async {
        // Given
        let expectedProperty = PropertyDetail.mock()
        mockRepository.mockPropertyDetail = expectedProperty

        // When
        await sut.fetchPropertyDetail()

        // Then
        XCTAssertEqual(sut.state, .loaded(expectedProperty))
    }

    /// Tests error handling during property detail fetch
    func testFetchPropertyDetail_Error() async {
        // Given
        let expectedError = NetworkError.invalidResponse
        mockRepository.mockError = expectedError

        // When
        await sut.fetchPropertyDetail()

        // Then
        XCTAssertEqual(sut.state, .error(expectedError))
    }

    /// Tests state transitions during property detail fetch
    func testFetchPropertyDetail_StateTransitions() async {
        // Given
        let expectedProperty = PropertyDetail.mock()
        mockRepository.mockPropertyDetail = expectedProperty

        // When & Then
        XCTAssertEqual(sut.state, .loading) // Initial state

        await sut.fetchPropertyDetail()

        XCTAssertEqual(sut.state, .loaded(expectedProperty)) // Final state
    }
}
