//
//  ViewModeToggleButton.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct ViewModeToggleButton: View {
    @Binding var isMapActive: Bool

    var body: some View {
        Button {
            isMapActive.toggle()
        } label: {
            HStack {
                Image(systemName: isMapActive ? "list.bullet" : "map")
                Text(isMapActive ? "List" : "Map")
            }
            .foregroundStyle(.text)
        }
    }
}
