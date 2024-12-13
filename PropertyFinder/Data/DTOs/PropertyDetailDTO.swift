//
//  PropertyDetailDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct PropertyDetailDTO: Decodable {
    let id: String
    let name: String
    let rating: DetailedRatingDTO?
    let bestFor: [String]
    let description: String
    let latitude: String?
    let longitude: String?
    let address1: String
    let address2: String?
    let directions: String
    let city: CityDTO
    let paymentMethods: [String]
    let policies: [String]
    let totalRatings: String
    let images: [ImageDTO]
    let type: String
    let depositPercentage: Int
    let associations: [String]
    let checkIn: CheckInDTO
}

