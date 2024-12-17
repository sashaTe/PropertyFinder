//
//  ViewStateTests.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import XCTest
@testable import PropertyFinder

final class ViewStateTests: XCTestCase {
    /// Tests if ViewState correctly returns loading state
    func testViewState_Loading() {
        let state = ViewState<String>.from(isLoading: true, error: nil, data: nil)
        XCTAssertEqual(state, .loading)
    }

    /// Tests if ViewState correctly returns error state with provided error
    func testViewState_Error() {
        let error = NetworkError.decodingError
        let state = ViewState<String>.from(isLoading: false, error: error, data: nil)
        XCTAssertEqual(state, .error(error))
    }

    /// Tests if ViewState correctly returns loaded state with provided data
    func testViewState_Loaded() {
        let data = "Test"
        let state = ViewState<String>.from(isLoading: false, error: nil, data: data)
        XCTAssertEqual(state, .loaded(data))
    }

    /// Tests if ViewState correctly returns empty state when no data provided
    func testViewState_Empty() {
        let state = ViewState<String>.from(isLoading: false, error: nil, data: nil)
        XCTAssertEqual(state, .empty)
    }
}
