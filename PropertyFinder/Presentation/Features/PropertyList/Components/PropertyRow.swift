//
//  PropertyRow.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct PropertyRow: View {
    let property: Property

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            propertyImage
            propertyInfo
        }
        .modifier(PropertyRowStyle())
    }

    private var propertyImage: some View {
        Group {
            // Image
            if let firstImage = property.images.first,
               let imageUrl = firstImage.url(size: .original) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                }
                .frame(height: 170)
                .clipShape(RoundedRectangle(cornerRadius: Layout.CornerRadius.medium))
                .padding(.bottom, Layout.Padding.medium)
            }
        }
    }

    private var propertyInfo: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(property.name)
                .foregroundStyle(.text)
                .font(.title3)
                .bold()
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(property.type.displayName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(property.city.name)
                        .font(.subheadline)
                        .foregroundColor(.text)
                }
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Text(property.rating.value)
                    .foregroundStyle(.text)
                    .font(.title3)
                    .bold()
            }
        }
        .padding(.horizontal)
    }
}
