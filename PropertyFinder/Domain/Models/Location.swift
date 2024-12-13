//
//  Location.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

enum Location {
    case available(latitude: Double, longitude: Double)
    case unavailable

    init(latitude: Double?, longitude: Double?) {
        guard let latitude,
              let longitude,
              latitude >= -90 && latitude <= 90,                // Valid latitude range
              longitude >= -180 && longitude <= 180 else {      // Valid longitude range
            self = .unavailable
            return
        }
        self = .available(latitude: latitude, longitude: longitude)
    }
}

extension Location: Equatable {}
