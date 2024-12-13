//
//  AboutContent.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct AboutContent: View {
    let property: PropertyDetail?

    var body: some View {
        if let property = property {
            Text(property.description)
                .font(.body)
                .padding()
        }
    }
}
