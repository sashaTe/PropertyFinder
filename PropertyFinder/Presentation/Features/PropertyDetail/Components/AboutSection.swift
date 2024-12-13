//
//  AboutSection.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct AboutSection: View {
    let property: PropertyDetail
    let onReadMore: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Divider()
            Text("About")
                .font(.title2)
                .bold()
            Text(property.description)
                .lineLimit(3)
                .font(.body)
            Button {
                onReadMore()
            } label: {
                HStack {
                    Spacer()
                    Text("Read more")
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
