//
//  DetailedRatingDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 16.12.2024.
//
import Foundation

/// A data transfer object that represents property ratings with detailed categories
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
