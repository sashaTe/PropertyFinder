//
//  Directions.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct DirectionsContent: View {
    let property: PropertyDetail?

    var body: some View {
        if let property = property {
            VStack {
                Text(property.directions)
            }
            .padding(.horizontal)
        }
    }
}
