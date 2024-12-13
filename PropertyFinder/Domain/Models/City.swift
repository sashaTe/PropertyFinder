//
//  City.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct City {
    let id: String
    let name: String
    let country: String

    init(dto: CityDTO) {
        self.id = dto.id
        self.name = dto.name
        self.country = dto.country
    }
}

extension City: Equatable {}
