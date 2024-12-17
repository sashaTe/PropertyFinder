//
//  PropertyDetailNavigation.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 17.12.2024.
//
import SwiftUI

struct PropertyDetailNavigation: ViewModifier {
    let navigationCoordinator: DefaultNavigationCoordinator

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        navigationCoordinator.navigateBack()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.text)
                    }
                }
            }
    }
}
