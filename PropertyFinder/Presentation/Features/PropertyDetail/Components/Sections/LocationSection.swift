//
//  LocationSection.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct LocationSection: View {
    let property: PropertyDetail
    let onGetDirections: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            switch property.location {
            case .available:
                MapView(location: property.location)
            case .unavailable:
                VStack {
                    Text("No location provided")
                }
            }
            Text("Location")
                .font(.headline)
            HStack {
                Image(systemName: "mappin.and.ellipse.circle")
                Text(property.address.line1)
                Text(property.address.line2 ?? "")
            }
            Button {
                onGetDirections()
            } label: {
                HStack {
                    Spacer()
                    Text("Get Directions")
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical)
                .bold()
                .font(.body)
                .foregroundStyle(.text)
            }

        }
    }
}
