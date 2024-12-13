//
//  PropertyListResponseDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct PropertyListResponseDTO: Decodable {
    let properties: [PropertyListItemDTO]
}

struct PropertyListItemDTO: Decodable {
    let id: String
    let name: String
    let city: CityDTO
    let latitude: String?
    let longitude: String?
    let type: String
    let images: [ImageDTO]
    let overallRating: RatingDTO?
}

