//
//  CheckInSection.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct CheckInSection: View {
    let property: PropertyDetail
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 40) {
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "arrow.right.square")
                            .foregroundStyle(.green)
                            .font(.title2)
                        VStack(alignment: .leading){
                            Text("Check In")
                                .font(.title3)
                                .bold()
                            Text(
                                property.checkIn.startTime.formattedTime()
                                + " - "
                                + property.checkIn.endTime.formattedTime()
                            )
                        }
                    }
                }
            }
        }
    }
}
