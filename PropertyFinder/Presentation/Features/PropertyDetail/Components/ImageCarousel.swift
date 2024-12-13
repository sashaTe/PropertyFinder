//
//  ImageCarousel.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct ImageCarousel: View {
    let property: PropertyDetail

    var body: some View {
        TabView {
            ForEach(property.images, id: \.prefix) { image in
                if let url = image.url() {
                    GeometryReader { geometry in
                        AsyncImage(url: url) { asyncImage in
                            asyncImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        } placeholder: {
                            Rectangle()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: Layout.CornerRadius.medium))
                    }
                    .padding(.horizontal, Layout.Padding.small)
                }
            }
        }
        .frame(height: 300)
        .tabViewStyle(.page)
    }
}
