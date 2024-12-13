//
//  PropertyType.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

enum PropertyType: String {
    case hostel = "HOSTEL"
    case hotel = "HOTEL"
    case apartment = "APARTMENT"
    case guesthouse = "GUESTHOUSE"
    case unrecognizedType

    var displayName: String {
        switch self {
        case .unrecognizedType: "Property"
        default: rawValue.capitalized
        }
    }
}
