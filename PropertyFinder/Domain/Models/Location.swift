//
//  Location.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// Represents geographical location with validation
enum Location {
    /// Location with valid coordinates
    case available(latitude: Double, longitude: Double)
    
    /// Location is not available or coordinates are invalid
    case unavailable

    /// Creates Location instance with validation of coordinates
    /// - Parameters:
    ///   - latitude: Optional latitude ( Valid range: -90 to 90)
    ///   - longitude: Optional longitude ( Valid range: -180 to 180)
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
