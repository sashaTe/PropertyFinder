//
//  NetworkServiceProtocol.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import Foundation

/// Protocol defining network service functionality for making API requests
protocol NetworkServiceProtocol {
    /// Fetches and decodes data from specified endpoint
    /// - Parameter endpoint: The API endpoint to request data from
    /// - Returns: Decoded object of type T that conforms to Decodable
    /// - Throws: NetworkError if request fails or response cannot be decoded
    func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T
}
