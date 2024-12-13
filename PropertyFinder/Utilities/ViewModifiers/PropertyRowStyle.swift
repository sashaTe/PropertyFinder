//
//  PropertyRowStyle.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 13.12.2024.
//

import SwiftUI

struct PropertyRowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.text)
            .padding(Layout.Padding.small)
            .background()
            .clipShape(RoundedRectangle(cornerRadius: Layout.CornerRadius.large))
            .overlay(
                RoundedRectangle(cornerRadius: Layout.CornerRadius.large)
                    .stroke(.border, lineWidth: 1)
            )
            .padding(.vertical, Layout.Padding.medium)
            .padding(.horizontal, Layout.Padding.large)
    }
}
