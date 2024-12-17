//
//  EmptyStateView.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct EmptyStateView: View {
    let message: String

    init(message: String = "No properties found") {
        self.message = message
    }

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "magnifyingglass")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Text(message)
                .font(.headline)
                .foregroundStyle(.secondary)
        }
    }
}
