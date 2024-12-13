//
//  NavigationCoordinator.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 13.12.2024.
//
import SwiftUI

/// A protocol defining the necessary navigation functions.
@MainActor
protocol NavigationCoordinator {
    /// The current navigation path.
    var path: NavigationPath { get set }

    /// Navigates to a specific route.
    /// - Parameter route: The route to navigate to.
    func navigate(to route: AppRoute)

    /// Navigates back by removing the last route.
    func navigateBack()

    /// Navigates to the root by clearing the navigation path.
    func navigateToRoot()
}
