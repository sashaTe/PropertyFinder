//
//  ErrorView.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct ErrorView: View {
    let error: Error
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Something went wrong")
                .font(.title)
            Text(error.localizedDescription)
                .font(.body)
                .foregroundColor(.secondary)
            Button("Try Again", action: retryAction)
                .buttonStyle(.bordered)
        }
    }
}
