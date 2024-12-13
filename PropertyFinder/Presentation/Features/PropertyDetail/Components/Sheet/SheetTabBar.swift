//
//  SheetTabBar.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import SwiftUI

struct SheetTabBar: View {
    @Binding var activeTab: SheetTab

    var body: some View {
        // Tabs
        HStack(spacing: 32) {
            ForEach(SheetTab.allCases) { tabContent in
                Button {
                    activeTab = tabContent
                } label: {
                    VStack(spacing: 8) {
                        Text(tabContent.title)
                            .foregroundStyle(activeTab == tabContent ? .text : .gray)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(activeTab == tabContent ? .text : .clear)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
