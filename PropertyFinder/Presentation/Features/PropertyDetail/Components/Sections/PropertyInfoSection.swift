//
//  PropertyInfoSection.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct PropertyInfoSection: View {
    let property: PropertyDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(property.type.displayName)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            HStack {
                Text(property.name)
                    .font(.title3)
                    .bold()
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Text(property.rating.categories.first?.formattedScore ?? "")
                    .font(.title3)
                    .bold()
            }
            HStack {
                Image(systemName: "mappin.and.ellipse.circle")
                Text("\(property.city.name),")
                Text(property.city.country)
            }
        }
    }
}
