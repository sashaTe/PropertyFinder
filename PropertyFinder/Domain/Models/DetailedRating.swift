//
//  DetailedRaiting.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct DetailedRating {
    let categories: [RatingCategory]

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
    struct RatingCategory: Equatable {
        let name: String
        private let score: Int

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

        var progressValue: Double {
            score > 0 ? Double(score) / 100 : 0
        }

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
