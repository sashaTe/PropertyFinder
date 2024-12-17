//
//  CheckInDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

/// A data transfer object that handles check-in time information with support for both string and integer formats.
struct CheckInDTO: Decodable {
    let startsAt: TimeValue
    let endsAt: TimeValue

    /// Represents a time value that can be either a string ("14") or an integer (14).
    enum TimeValue: Decodable {
        case string(String)
        case integer(Int)

        /// Decodes time value from either string or integer format.
        /// Throws DecodingError if the data can't be decoded as either type.
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let intValue = try? container.decode(Int.self) {
                self = .integer(intValue)
            } else if let stringValue = try? container.decode(String.self) {
                self = .string(stringValue)
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Expected string or integer value")
            }
        }

        /// Returns a string representation of the time value
        var stringValue: String {
            switch self {
            case .integer(let value):
                return String(value)
            case .string(let value):
                return value
            }
        }
    }
}
