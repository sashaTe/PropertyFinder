//
//  CityDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct CityDTO: Decodable {
    let id: String
    let name: String
    let country: String
    let idCountry: String
}
