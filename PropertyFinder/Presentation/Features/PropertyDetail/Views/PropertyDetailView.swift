//
//  PropertyDetail.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import SwiftUI
import MapKit

/// A view that displays detailed information about a specific property.
struct PropertyDetailView: View {
    @ObservedObject var navigationCoordinator: DefaultNavigationCoordinator
    @StateObject private var viewModel: PropertyDetailViewModel
    @State private var isSheetPresented = false
    @State private var activeTab: SheetTab = .about

    /// Initializes the `PropertyDetailView` with the necessary dependencies and property ID.
       /// - Parameters:
       ///   - container: The dependency container used to create the view model.
       ///   - propertyId: The ID of the property to display.
       ///   - navigationCoordinator: The navigation coordinator managing navigation and sheet presentations.
    init(container: DependencyContainerProtocol, propertyId: String, navigationCoordinator: DefaultNavigationCoordinator) {
        self.navigationCoordinator = navigationCoordinator
        self._viewModel = StateObject(wrappedValue: container.makePropertyDetailViewModel(propertyId: propertyId))
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error(let error):
                ErrorView(error: error) {
                    Task { await viewModel.fetchPropertyDetail()}
                }
            case .loaded(let property):
                propertyDetailContent(property)
                    .sheet(isPresented: $isSheetPresented) {
                        PropertyDetailSheet(
                            isPresented: $isSheetPresented,
                            activeTab: $activeTab,
                            property: property
                        )
                    }
            case .empty:
                EmptyStateView(message: "Property not found")
            }
        }
        .task {
            await viewModel.fetchPropertyDetail()
        }
        .modifier(PropertyDetailNavigation(navigationCoordinator: navigationCoordinator))
    }
}

// MARK: - Content Views

extension PropertyDetailView {
    /// The detailed content of the property view.
    /// - Parameter property: The property details to display.
    /// - Returns: A view representing the property details.
    private func propertyDetailContent(_ property: PropertyDetail) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ImageCarousel(property: property)
                Group {
                    PropertyInfoSection(property: property)
                    AboutSection(property: property) {
                        showSheet(tab: .about)
                    }
                    CheckInSection(property: property)
                    HouseRulesSection(property: property) {
                        showSheet(tab: .houseRules)
                    }
                    ReviewsSection(property: property)
                    LocationSection(property: property) {
                        showSheet(tab: .directions)
                    }

                }
                .padding(.horizontal, Layout.Padding.large)
            }
        }
        .navigationTitle(property.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Sheet Handling

extension PropertyDetailView {
    /// Presents the sheet for the specified tab.
    /// - Parameter tab: The tab to present in the sheet.
    private func showSheet(tab: SheetTab) {
        activeTab = tab
        isSheetPresented = true
    }
}










