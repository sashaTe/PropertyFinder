//
//  DefaultNavigationCoordinator.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 11.12.2024.
//

import SwiftUI

/// The default implementation of the `NavigationCoordinator` protocol.
/// Manages navigation paths and sheet presentations.
@MainActor
final class DefaultNavigationCoordinator: NavigationCoordinator, ObservableObject {
    /// The current navigation path.
    @Published var path: NavigationPath = NavigationPath()

    /// Navigates to a specific route.
    /// - Parameter route: The route to navigate to.
    func navigate(to route: AppRoute) {
        path.append(route)
    }

    /// Navigates back by removing the last route.
    func navigateBack() {
        if path.count > 0 {
            path.removeLast()
        }
    }

    /// Navigates to the root by clearing the navigation path.
    func navigateToRoot() {
        path.removeLast(path.count)
    }

}



