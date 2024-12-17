//
//  PropertyListViewModel.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

@MainActor
final class PropertyListViewModel: ObservableObject {
    @Published private(set) var state: ViewState<[Property]> = .loading

    private let repository: PropertyRepositoryProtocol

    init(repository: PropertyRepositoryProtocol) {
        self.repository = repository
    }

    func fetchProperties() async {
        state = .loading

        do {
            let properties = try await repository.fetchProperties(cityId: 1530)
            state = properties.isEmpty ? .empty : .loaded(properties)
        } catch {
            state = .error(error)
        }
    }
}
