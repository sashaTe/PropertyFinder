//
//  PropertyMapPreview.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 10.12.2024.
//

import SwiftUI

struct PropertyMapPreview: View {
    let property: Property

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let firstImage = property.images.first {
                AsyncImage(url: firstImage.url()) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.3))
                }
                .frame(height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Text(property.name)
                .font(.headline)
        }
        .frame(width: 240)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: Layout.CornerRadius.medium))
        .shadow(radius: 4)
    }
}
