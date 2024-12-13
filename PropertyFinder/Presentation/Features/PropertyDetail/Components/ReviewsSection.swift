//
//  ReviewsSection.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import SwiftUI

struct ReviewsSection: View {
    let property: PropertyDetail?

    var body: some View {
        if let property = property {
            VStack(alignment: .leading, spacing: 16) {
                Text("Reviews")
                    .font(.title2)
                    .bold()

                if let firstCategory = property.rating.categories.first {
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(firstCategory.formattedScore)
                            .font(.title)
                            .bold()
                        Text(firstCategory.ratingComment)
                            .font(.subheadline)

                    }
                    if firstCategory.formattedScore != "Not rated" {
                        ForEach(property.rating.categories.dropFirst(), id: \.name) { category in
                            HStack {
                                Text(category.name)
                                    .frame(width: 120, alignment: .leading)
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(.border)
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(.orange)
                                        .frame(width: UIScreen.main.bounds.width * 0.5 * category.progressValue)
                                }
                                .frame(height: 8)
                                Text(category.formattedScore)
                                    .frame(width: 40)
                            }
                        }
                    }
                }
                Divider()
            }
        }
    }
}
