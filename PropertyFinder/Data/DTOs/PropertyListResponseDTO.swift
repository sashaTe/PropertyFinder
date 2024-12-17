//
//  PropertyListResponseDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// A data transfer object that represents a list of properties response
struct PropertyListResponseDTO: Decodable {
    let properties: [PropertyListItemDTO]
}

