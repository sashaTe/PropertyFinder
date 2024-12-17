//
//  CheckIn.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// Represents check-in time information for a property
struct CheckIn {
    let startTime: String
    let endTime: String

    init(dto: CheckInDTO) {
        self.startTime = dto.startsAt.stringValue
        self.endTime = dto.endsAt.stringValue
    }
}

extension CheckIn: Equatable {}
