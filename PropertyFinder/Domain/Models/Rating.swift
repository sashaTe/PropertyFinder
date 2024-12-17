//
//  Rating.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// Represents the rating information for a property
struct Rating {
    /// Raw score value (0-100)
    private let score: Int
    
    /// Number of reviews submitted
    let reviewCount: Int

    /// Formatted rating value as string
    /// Returns decimal score (e.g. "8.5") or "Not rated" if no score available
    var value: String {
        if score > 0 {
            let decimal = Double(score) / 10
            return String(format: "%.1f", decimal)
        }
        return "Not rated"
    }

    init(dto: RatingDTO?) {
        self.score = dto?.overall ?? 0
        self.reviewCount = dto?.numberOfRatings ?? 0
    }
}

extension Rating: Equatable {}
