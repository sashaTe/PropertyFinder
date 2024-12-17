//
//  PropertyList.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import SwiftUI

/// A view that displays a list of properties, which can be toggled between a list view and a map view.
struct PropertyList: View {
    @StateObject private var navigationCoordinator: DefaultNavigationCoordinator = DefaultNavigationCoordinator()
    @StateObject private var viewModel: PropertyListViewModel

    private let container: DependencyContainerProtocol

    @State private var isMapActive = false

    /// Represents the current state of the view (loading, error, loaded, or empty).
    private var viewState: ViewState<[Property]> {
        .from(
            isLoading: viewModel.isLoading,
            error: viewModel.error,
            data: viewModel.properties.isEmpty ? nil : viewModel.properties
        )
    }

    init(container: DependencyContainerProtocol) {
        self.container = container
        _viewModel = StateObject(wrappedValue: container.makePropertyListViewModel())
    }

    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            Group {
                mainContent
                    .navigationDestination(for: AppRoute.self, destination: navigationDestination)
                    .navigationTitle("Gothenburg")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            ViewModeToggleButton(isMapActive: $isMapActive)
                        }
                    }
                }
            .task {
                await viewModel.fetchProperties()
            }
        }
    }
}

// MARK: - Content Views
 extension PropertyList {
     /// The main content of the property list, switching between map and list views.
    @ViewBuilder
    var mainContent: some View {
        Group {
            switch viewState {
            case .loading:
                ProgressView()
            case .error(let error):
                ErrorView(error: error) {
                    Task { await viewModel.fetchProperties() }
                }
            case .loaded(let properties):
                contentBasedOnViewMode(properties: properties)
            case .empty:
                EmptyStateView()
            }

        }
    }

     @ViewBuilder
     func contentBasedOnViewMode(properties: [Property]) -> some View {
         if isMapActive {
             PropertyMapView(
                properties: properties,
                navigationCoordinator: navigationCoordinator
            )
         } else {
             PropertyListContent(
                properties: properties) { propertyId in
                    navigationCoordinator.navigate(
                        to: .propertyDetail(id: propertyId)
                    )
                }
         }
     }
}

// MARK: - Navigation
extension PropertyList {
    /// Handles the navigation destination based on the given route.
    /// - Parameter route: The navigation route.
    /// - Returns: The corresponding view for the route.
    @ViewBuilder
    func navigationDestination(for route: AppRoute) -> some View {
        switch route {
        case .propertyDetail(let id):
            PropertyDetailView(container: container, propertyId: id, navigationCoordinator: navigationCoordinator)
        default:
            EmptyView()
        }
    }
}



