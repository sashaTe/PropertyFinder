//
//  PropertyDetailSheet.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct PropertyDetailSheet: View {
    @Binding var isPresented: Bool
    @Binding var activeTab: SheetTab
    let property: PropertyDetail?

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                SheetTabBar(activeTab: $activeTab)


                Divider()

                ScrollView {
                    switch activeTab {
                    case .about:
                        AboutContent(property: property)
                    case .houseRules:
                        HouseRulesContent(property: property)
                    case .directions:
                        DirectionsContent(property: property)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Property Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.text)
                    }
                }
            }
        }
    }
}
