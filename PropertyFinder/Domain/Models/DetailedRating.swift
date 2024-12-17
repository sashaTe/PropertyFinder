//
//  DetailedRaiting.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// Represents detailed rating information with multiple categories
struct DetailedRating {
    /// Array of rating categories with individual scores
    let categories: [RatingCategory]

    /// Creates DetailedRating from DTO, converting all categories
    /// - Parameter dto: Data transfer object containing rating information
    init(dto: DetailedRatingDTO) {
        self.categories = [
            RatingCategory(name: "Overall", score: dto.overall ?? 0),
            RatingCategory(name: "Value for Money", score: dto.valueForMoney ?? 0),
            RatingCategory(name: "Security", score: dto.security ?? 0),
            RatingCategory(name: "Atmosphere", score: dto.atmosphere ?? 0),
            RatingCategory(name: "Cleanliness", score: dto.cleanliness ?? 0),
            RatingCategory(name: "Staff", score: dto.staff ?? 0),
            RatingCategory(name: "Location", score: dto.location ?? 0),
            RatingCategory(name: "Facilities", score: dto.facilities ?? 0)
        ]
    }
    /// Represents a single rating category with score and formatting options
    struct RatingCategory: Equatable {
        /// Name of the rating category
        let name: String

        /// Raw score value (0-100)
        private let score: Int

        /// Converts numerical score to descriptive rating
        var ratingComment: String {
            let rating = Double(score) / 10
            switch rating {
            case 9...:  return "SUPERB"
            case 8..<9: return "FABULOUS"
            case 7..<8: return "VERY GOOD"
            case 6..<7: return "GOOD"
            case 4..<6: return "FAIR"
            default: return ""
            }
        }

        /// Converts score to progress value (0.0-1.0) for UI elements
        var progressValue: Double {
            score > 0 ? Double(score) / 100 : 0
        }

        /// Formats score as decimal string (e.g., "8.5")
        var formattedScore: String {
            if score > 0 {
                let decimal = Double(score) / 10
                return String(format: "%.1f", decimal)
            }
            return "Not rated"
        }

        init(name: String, score: Int) {
            self.name = name
            self.score = score
        }
    }
}

extension DetailedRating: Equatable {}
