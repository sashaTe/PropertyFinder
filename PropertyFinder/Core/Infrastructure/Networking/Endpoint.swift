//
//  Endpoint.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import Foundation

/// Represents API endpoints for the property finder service
enum Endpoint {
    /// Fetches properties for a specific city
    case cityProperties(cityId: Int)
    /// Fetches detailed information for a specific property
    case propertyDetail(id: String)

    /// Base URL for the API
    private var baseURL: String {
        "https://private-anon-c18053fdbb-practical3.apiary-mock.com"
    }

    /// Constructs the path component for the endpoint
    private var path: String {
        switch self {
        case .cityProperties(let cityId):
            return "/cities/\(cityId)/properties/"
        case .propertyDetail(let id):
            return "/properties/\(id)"
        }
    }

    /// Constructs full URL for the endpoint
    var url: URL? {
        URL(string: baseURL + path)
    }
}
