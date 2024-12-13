//
//  NetworkService.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder

        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        do {
            let (data, response) = try await session.data(from: url)

            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard (200...299).contains(response.statusCode) else {
                throw NetworkError.serverError(response.statusCode)
            }

            do {
              return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError
            }

        } catch(let error as NetworkError) {
            throw error
        } catch {
            throw NetworkError.unknownError(error)
        }
    }
}
