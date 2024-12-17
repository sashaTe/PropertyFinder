//
//  PropertyListView.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct PropertyListContent: View {
    let properties: [Property]
    let onPropertyTap: (String) -> Void

    var body: some View {
        ScrollView {
            ForEach(properties) { property in
                Button {
                    onPropertyTap(property.id)
                } label: {
                    PropertyRow(property: property)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}
