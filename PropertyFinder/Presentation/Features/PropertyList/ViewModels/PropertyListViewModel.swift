//
//  PropertyListViewModel.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

@MainActor
final class PropertyListViewModel: ObservableObject {
    @Published private(set) var properties: [Property] = []
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?

    private let repository: PropertyRepositoryProtocol

    init(repository: PropertyRepositoryProtocol) {
        self.repository = repository
    }

    func fetchProperties() async {
        defer { isLoading = false }
        isLoading = true
        error = nil

        do {
            properties = try await repository.fetchProperties(cityId: 1530)
        } catch {
            self.error = error
        }
    }
}
