//
//  CheckInDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//


struct CheckInDTO: Decodable {
    let startsAt: TimeValue
    let endsAt: TimeValue

    enum TimeValue: Decodable {
        case string(String)
        case integer(Int)

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
