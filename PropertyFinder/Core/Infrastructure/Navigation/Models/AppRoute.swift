//
//  AppRoute.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 13.12.2024.
//
import SwiftUI

/// Represents the navigation routes available in the application
enum AppRoute: Hashable {
    case propertyList
    case propertyDetail(id: String)
}
