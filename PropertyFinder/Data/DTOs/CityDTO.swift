//
//  CityDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// A data transfer object that represents city information
struct CityDTO: Decodable {
    let id: String
    let name: String
    let country: String
    let idCountry: String
}
