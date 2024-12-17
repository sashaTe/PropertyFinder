//
//  PropertyListItemDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 16.12.2024.
//
import Foundation

/// A data transfer object that represents basic property information in a list
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
