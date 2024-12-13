//
//  RatingDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct RatingDTO: Decodable {
    let overall: Int?
    let numberOfRatings: Int
}

struct DetailedRatingDTO: Decodable {
    let overall: Int?
    let atmosphere: Int?
    let cleanliness: Int?
    let facilities: Int?
    let staff: Int?
    let security: Int?
    let location: Int?
    let valueForMoney: Int?

    init() {
        self.overall = nil
        self.atmosphere = nil
        self.cleanliness = nil
        self.facilities = nil
        self.staff = nil
        self.security = nil
        self.location = nil
        self.valueForMoney = nil
    }

}
