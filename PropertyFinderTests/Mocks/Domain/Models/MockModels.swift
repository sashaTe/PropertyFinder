//
//  MockModels.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//

import Foundation
@testable import PropertyFinder

extension Property {
    /// Creates a mock Property instance with test data
    static func mock() -> Property {
        Property(
            dto: PropertyListItemDTO(
                id: "123",
                name: "Test Property",
                city: CityDTO(id: "123", name: "Porto", country: "Portugal", idCountry: "123"),
                latitude: "57.6992285",
                longitude: "57.6992285",
                type: "HOSTEL",
                images: [],
                overallRating: nil
            )
        )
    }
}

extension PropertyDetail {
    /// Creates a mock PropertyDetail instance with test data
    static func mock() -> PropertyDetail {
        PropertyDetail(dto: PropertyDetailDTO(
            id: "123",
            name: "Test Property",
            rating: DetailedRatingDTO(),
            bestFor: [],
            description: "Test Description",
            latitude: "57.6992285",
            longitude: "11.9368171",
            address1: "Test Adress",
            address2: "",
            directions: "Test Directions",
            city: CityDTO(id: "1530", name: "Gothenburg", country: "Sweden", idCountry: "202"),
            paymentMethods: ["Visa"],
            policies: ["No smoking"],
            totalRatings: "400",
            images: [],
            type: "HOSTEL",
            depositPercentage: 19,
            associations: [],
            checkIn: CheckInDTO(startsAt: .string("14"), endsAt: .string("17")))
        )
    }
}

extension PropertyListItemDTO {
    /// Creates a mock PropertyListItemDTO instance with test data
    static func mock() -> PropertyListItemDTO {
        PropertyListItemDTO(
            id: "123",
            name: "Test Property",
            city: CityDTO(id: "123", name: "Porto", country: "Portugal", idCountry: "123"),
            latitude: "57.6992285",
            longitude: "57.6992285",
            type: "HOSTEL",
            images: [],
            overallRating: nil
        )
    }
}

extension PropertyDetailDTO {
    /// Creates a mock PropertyDetailDTO instance with test data
    static func mock() -> PropertyDetailDTO {
        PropertyDetailDTO(
            id: "123",
            name: "Test Property",
            rating: DetailedRatingDTO(),
            bestFor: [],
            description: "Test Description",
            latitude: "57.6992285",
            longitude: "11.9368171",
            address1: "Test Adress",
            address2: "",
            directions: "Test Directions",
            city: CityDTO(id: "1530", name: "Gothenburg", country: "Sweden", idCountry: "202"),
            paymentMethods: ["Visa"],
            policies: ["No smoking"],
            totalRatings: "400",
            images: [],
            type: "HOSTEL",
            depositPercentage: 19,
            associations: [],
            checkIn: CheckInDTO(startsAt: .string("14"), endsAt: .string("17"))
        )
    }
}
