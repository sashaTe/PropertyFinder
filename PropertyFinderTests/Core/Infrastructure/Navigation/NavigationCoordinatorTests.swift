//
//  NavigationCoordinatorTests.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import XCTest
@testable import PropertyFinder

@MainActor
final class NavigationCoordinatorTests: XCTestCase {
    var sut: NavigationCoordinator!

    override func setUp() {
        super.setUp()
        sut = DefaultNavigationCoordinator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    /// Test navigation to property detail screen
    func testNavigate_ToPropertyDetail() {
        // Given
        let route = AppRoute.propertyDetail(id: "123")

        // When
        sut.navigate(to: route)

        // Then
        XCTAssertEqual(sut.path.count, 1)
    }

    /// Test back navigation removes the last route from path
    func testNavigateBack_RemovesLastRoute() {
        // Given
        let route1 = AppRoute.propertyDetail(id: "123")
        let route2 = AppRoute.propertyList
        sut.navigate(to: route1)
        sut.navigate(to: route2)
        XCTAssertEqual(sut.path.count, 2)

        // When
        sut.navigateBack()

        // Then
        XCTAssertEqual(sut.path.count, 1)
    }

    /// Test navigation to root clears the entire navigation path
    func testNavigateToRoot_ClearsPath() {
        // Given
        let routes = [
            AppRoute.propertyDetail(id: "123"),
            AppRoute.propertyList,
            AppRoute.propertyDetail(id: "456")
        ]

        routes.forEach { sut.navigate(to: $0) }
        XCTAssertEqual(sut.path.count, 3)

        // When
        sut.navigateToRoot()

        // Then
        XCTAssertEqual(sut.path.count, 0)
    }

    /// Test back navigation on empty path doesn't cause issues
    func testNavigateBack_EmptyPath() {
        // Given
        XCTAssertEqual(sut.path.count, 0)

        // When
        sut.navigateBack()

        // Then
        XCTAssertEqual(sut.path.count, 0)
    }
}
