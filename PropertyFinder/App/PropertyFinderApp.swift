//
//  PropertyFinderApp.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import SwiftUI

@main
struct PropertyFinderApp: App {
    private let container: DependencyContainer

    init() {
        self.container = DependencyContainer()
    }
    var body: some Scene {
        WindowGroup {
            PropertyList(container: container)
        }
    }
}
