//
//  SheetTab.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

enum SheetTab: CaseIterable, Identifiable {
    case about
    case houseRules
    case directions

    var id: Self { self }

    var title: String {
        switch self {
        case .about: return "About"
        case .houseRules: return "House Rules"
        case .directions: return "Directions"
        }
    }
}
