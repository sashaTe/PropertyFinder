//
//  PropertyDetail.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//
import Foundation

struct PropertyDetail: Identifiable {
    let id: String
    let name: String
    let type: PropertyType
    let rating: DetailedRating
    let bestFor: [String]
    let description: String
    let location: Location
    let address: Address
    let directions: String
    let city: City
    let paymentMethods: [String]
    let policies: [String]
    let images: [ImageDTO]
    let depositPercentage: Int
    let associations: [String]
    let checkIn: CheckIn
    
    struct Address {
        let line1: String
        let line2: String?
        
        var fullAddress: String {
            if let line2, !line2.isEmpty {
                return "\(line1), \(line2)"
            }
            return line1
        }
    }
    
    init(dto: PropertyDetailDTO) {
        self.id = dto.id
        self.name = dto.name
        self.type = PropertyType(rawValue: dto.type) ?? .unrecognizedType
        self.rating = DetailedRating(dto: dto.rating ?? DetailedRatingDTO())
        self.bestFor = dto.bestFor
        self.description = dto.description
        self.location = Location(
            latitude: Double(dto.latitude ?? ""),
            longitude: Double(dto.longitude ?? "")
        )
        self.address = Address(
            line1: dto.address1,
            line2: dto.address2
        )
        self.directions = dto.directions
        self.city = City(dto: dto.city)
        self.paymentMethods = dto.paymentMethods
        self.policies = dto.policies
        self.images = dto.images
        self.depositPercentage = dto.depositPercentage
        self.associations = dto.associations
        self.checkIn = CheckIn(dto: dto.checkIn)
    }
}


extension PropertyDetail: Equatable {
    static func == (lhs: PropertyDetail, rhs: PropertyDetail) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.type == rhs.type &&
        lhs.rating == rhs.rating &&
        lhs.bestFor == rhs.bestFor &&
        lhs.description == rhs.description &&
        lhs.location == rhs.location &&
        lhs.address == rhs.address &&
        lhs.directions == rhs.directions &&
        lhs.city == rhs.city &&
        lhs.paymentMethods == rhs.paymentMethods &&
        lhs.policies == rhs.policies &&
        lhs.images == rhs.images &&
        lhs.depositPercentage == rhs.depositPercentage &&
        lhs.associations == rhs.associations &&
        lhs.checkIn == rhs.checkIn
    }
    

}

extension PropertyDetail.Address: Equatable {
    static func == (lhs: PropertyDetail.Address, rhs: PropertyDetail.Address) -> Bool {
        lhs.line1 == rhs.line1 &&
        lhs.line2 == rhs.line2
    }
}
