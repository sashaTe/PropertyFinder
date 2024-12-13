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
    var sut: DefaultNavigationCoordinator!

    override func setUp() {
        super.setUp()
        sut = DefaultNavigationCoordinator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNavigate_ToPropertyDetail() {
        // Given
        let route = AppRoute.propertyDetail(route: .root(id: "123"))

        // When
        sut.navigate(to: route)

        // Then
        XCTAssertEqual(sut.path.count, 1)
    }

    func testNavigateBack_RemovesLastRoute() {
        // Given
        let route1 = AppRoute.propertyDetail(route: .root(id: "123"))
        let route2 = AppRoute.propertyDetail(route: .about)
        sut.navigate(to: route1)
        sut.navigate(to: route2)
        XCTAssertEqual(sut.path.count, 2)

        // When
        sut.navigateBack()

        // Then
        XCTAssertEqual(sut.path.count, 1)
    }

    func testNavigateToRoot_ClearsPath() {
        // Given
        let route1 = AppRoute.propertyDetail(route: .root(id: "123"))
        let route2 = AppRoute.propertyDetail(route: .about)
        let route3 = AppRoute.propertyDetail(route: .houseRules)
        sut.navigate(to: route1)
        sut.navigate(to: route2)
        sut.navigate(to: route3)
        XCTAssertEqual(sut.path.count, 3)

        // When
        sut.navigateToRoot()

        // Then
        XCTAssertEqual(sut.path.count, 0)
    }

    func testNavigateBack_EmptyPath() {
        // Given
        XCTAssertEqual(sut.path.count, 0)

        // When
        sut.navigateBack()

        // Then
        XCTAssertEqual(sut.path.count, 0)
    }
}
