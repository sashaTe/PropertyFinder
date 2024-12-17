//
//  NetworkError.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import Foundation

/// Network-related errors that can occur during API requests
enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(Int)
    case unknownError(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "This URL is invalid. Please try again later or contact support."
        case .invalidResponse:
            return "We received an in invalid response from the server. Please try again."
        case .decodingError:
            return "We couldn't process the data received from the server. Please try again later"
        case .serverError(let code):
            return "Server error: \(code). Please try again later"
        case .unknownError(let error):
            return "An unexpected error occurred: \(error.localizedDescription)"
        }
    }
}

extension NetworkError: Equatable {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL):
            return true
        case (.invalidResponse, .invalidResponse):
            return true
        case (.decodingError, .decodingError):
            return true
        case (.serverError(_), .serverError(_)):
            return true
        case (.unknownError(_), .unknownError(_)):
            return true
        default:
            return false
        }
    }
}
