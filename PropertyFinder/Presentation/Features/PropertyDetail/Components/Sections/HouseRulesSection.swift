//
//  HouseRulesSection.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct HouseRulesSection: View {
    let property: PropertyDetail
    let onViewRules: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()

            if let firstPolicy = property.policies.first {
                HStack(spacing: 12) {
                    Circle()
                        .fill(.text)
                        .frame(width: 4, height: 4)
                    Text(firstPolicy)
                        .font(.subheadline)
                }
            }

            Button {
                onViewRules()
            } label: {
                HStack {
                    Spacer()
                    Text("View all House Rules")
                    Image(systemName: "chevron.right")
                }
                .bold()
                .font(.body)
                .foregroundStyle(.text)
            }

            Divider()
        }
    }
}
