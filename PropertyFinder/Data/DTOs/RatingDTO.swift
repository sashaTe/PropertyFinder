//
//  RatingDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// A data transfer object that represents basic rating information
struct RatingDTO: Decodable {
    let overall: Int?
    let numberOfRatings: Int
}
