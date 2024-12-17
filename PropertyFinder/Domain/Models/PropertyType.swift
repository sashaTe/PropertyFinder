//
//  PropertyType.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// Represents different types of properties available in the system
enum PropertyType: String {
    case hostel = "HOSTEL"
    case hotel = "HOTEL"
    case apartment = "APARTMENT"
    case guesthouse = "GUESTHOUSE"
    case unrecognizedType

    /// User-friendly display name for the property type
    var displayName: String {
        switch self {
        case .unrecognizedType: "Property"
        default: rawValue.capitalized
        }
    }
}
