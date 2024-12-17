//
//  Layout.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 13.12.2024.
//

import Foundation

enum Layout {
    enum Padding {
        static let small: CGFloat = 6
        static let medium: CGFloat = 8
        static let large: CGFloat = 16
    }

    enum CornerRadius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
    }

    enum ImageSize {
        static let carousel: CGFloat = 300
        static let preview: CGFloat = 120
    }
}
