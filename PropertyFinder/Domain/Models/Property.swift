//
//  Property.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct Property: Identifiable {
    let id: String
    let name: String
    let city: City
    let type: PropertyType
    let rating: Rating
    let images: [ImageDTO]
    let location: Location

    init(dto: PropertyListItemDTO) {
        self.id = dto.id
        self.name = dto.name
        self.city = City(dto: dto.city)
        self.type = PropertyType(rawValue: dto.type) ?? .unrecognizedType
        self.rating = Rating(dto: dto.overallRating)
        self.images = dto.images
        self.location = Location(
            latitude: Double(dto.latitude ?? ""),
            longitude: Double(dto.longitude ?? "")
        )
    }
}

extension Property: Equatable {
    static func == (lhs: Property, rhs: Property) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.type == rhs.type &&
        lhs.rating == rhs.rating &&
        lhs.images == rhs.images &&
        lhs.location == rhs.location
    }
}
