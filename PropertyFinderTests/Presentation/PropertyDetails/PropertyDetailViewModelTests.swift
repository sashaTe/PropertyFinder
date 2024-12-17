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

    /// Tests successful property detail fetch
    func testFetchPropertyDetail_Success() async {
        // Given
        let expectedProperty = PropertyDetail.mock()
        mockRepository.mockPropertyDetail = expectedProperty

        // When
        await sut.fetchPropertyDetail()

        XCTAssertEqual(sut.property, expectedProperty)
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.error)
    }

    /// Tests error handling during property detail fetch
    func testFetchPropertyDetail_Error() async {
        // Given
        mockRepository.mockError = NetworkError.invalidResponse

        // When
        await sut.fetchPropertyDetail()

        XCTAssertNil(sut.property)
        XCTAssertFalse(sut.isLoading)
        XCTAssertNotNil(sut.error)
    }

    /// Tests loading state during property detail fetch
    func testFetchPropertyDetail_LoadingState() async {
        // Given
        let expectedProperty = PropertyDetail.mock()
        mockRepository.mockPropertyDetail = expectedProperty

        // When
        let task = Task {
            XCTAssertFalse(sut.isLoading)
            await sut.fetchPropertyDetail()
            
            // Then
            XCTAssertFalse(sut.isLoading)
        }

        await task.value
    }

}
