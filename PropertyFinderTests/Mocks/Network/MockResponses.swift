//
//  MockResponses.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import Foundation

enum MockResponses {
    static let validPropertyListResponse = """
        {
            "properties": [
                {
                    "id": "32849",
                    "name": "Test Property",
                    "city": {
                        "id": "1530",
                        "name": "Gothenburg",
                        "country": "Sweden",
                        "idCountry": "202"
                    },
                    "latitude": "57.70",
                    "longitude": "11.97",
                    "type": "HOSTEL",
                    "images": [],
                    "overallRating": {
                        "overall": 82,
                        "numberOfRatings": 400
                    }
                }
            ]
        }
        """.data(using: .utf8)

    static let validPropertDetailResponse = """
        {
          "id": "32849",
          "name": "STF Vandrarhem Stigbergsliden",
          "rating": {
            "overall": 82,
            "atmosphere": 71,
            "cleanliness": 86,
            "facilities": 80,
            "staff": 95,
            "security": 87,
            "location": 77,
            "valueForMoney": 81
          },
          "bestFor": [],
          "description": "Set in a listed building from the mid-1800s...",
          "latitude": "57.6992285",
          "longitude": "11.9368171",
          "address1": "Stigbergsliden 10",
          "address2": "",
          "directions": "Public transportation: Take the tram number 3...",
          "city": {
            "id": "1530",
            "name": "Gothenburg",
            "country": "Sweden",
            "idCountry": "202"
          },
          "paymentMethods": ["Visa", "Mastercard"],
          "policies": [
            "Child Friendly",
            "Credit Cards Accepted",
            "No Curfew",
            "Non Smoking",
            "Pet Friendly",
            "Taxes Included"
          ],
          "totalRatings": "400",
          "images": [
            {
              "suffix": ".jpg",
              "prefix": "http://ucd.hwstatic.com/propertyimages/3/32849/7"
            }
          ],
          "type": "HOSTEL",
          "depositPercentage": 19,
          "associations": ["YHA"],
          "checkIn": {
            "startsAt": "14",
            "endsAt": "17"
          }
        }
        """.data(using: .utf8)

    static let invalidResponse = "Invalid JSON".data(using: .utf8)
}
