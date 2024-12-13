//
//  PropertyCache.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 10.12.2024.
//

import Foundation

actor PropertyCache {
    private var properties: [Int: [Property]] = [:]
    private var propertyDetails: [String: PropertyDetail] = [:]
    private let expirationInterval: TimeInterval

    init(expirationInterval: TimeInterval = 300) {
        self.expirationInterval = expirationInterval
    }

    func cacheProperties(_ properties: [Property], forCityId cityId: Int) {
        self.properties[cityId] = properties
    }

    func getCachedProperties(forCityId cityId: Int) -> [Property]? {
        properties[cityId]
    }

    func cachePropertyDetail(_ property: PropertyDetail) {
        propertyDetails[property.id] = property
    }

    func getCachedPropertyDetail(id: String) -> PropertyDetail? {
        propertyDetails[id]
    }

    func clearCache() {
        properties.removeAll()
        propertyDetails.removeAll()
    }
}
