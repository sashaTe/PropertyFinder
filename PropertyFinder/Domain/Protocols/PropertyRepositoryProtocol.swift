//
//  PropertyRepositoryProtocol.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 10.12.2024.
//

import Foundation

protocol PropertyRepositoryProtocol {
    func fetchProperties(cityId: Int) async throws -> [Property]
    func fetchPropertyDetail(id: String) async throws -> PropertyDetail
}
