//
//  Rating.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct Rating {
    private let score: Int
    let reviewCount: Int

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
