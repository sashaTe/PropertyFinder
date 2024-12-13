//
//  Endpoint.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import Foundation

enum Endpoint {
    case cityProperties(cityId: Int)
    case propertyDetail(id: String)

    private var baseURL: String {
        "https://private-anon-c18053fdbb-practical3.apiary-mock.com"
    }

    private var path: String {
        switch self {
        case .cityProperties(let cityId):
            return "/cities/\(cityId)/properties/"
        case .propertyDetail(let id):
            return "/properties/\(id)"
        }
    }

    var url: URL? {
        URL(string: baseURL + path)
    }
}
