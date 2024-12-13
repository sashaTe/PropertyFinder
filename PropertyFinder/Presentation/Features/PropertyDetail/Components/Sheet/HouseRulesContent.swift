//
//  HouseRulesContent.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct HouseRulesContent: View {
    let property: PropertyDetail?

    var body: some View {
        if let property = property {
            VStack(alignment: .leading, spacing: 24) {
                CheckInSection(property: property)

                Text("Hostel Policies")
                    .font(.title2)
                    .bold()
                ForEach(property.policies, id: \.self) { policy in
                    HStack(spacing: 12) {
                        Circle()
                            .fill(.text)
                            .frame(width: 4, height: 4)
                        Text(policy)
                    }
                }
            }
            .padding()
        }
    }
}
