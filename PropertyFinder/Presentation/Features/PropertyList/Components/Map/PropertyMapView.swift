//
//  PropertiesMapvView.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 10.12.2024.
//

import SwiftUI
import MapKit

struct PropertyMapView: View {
    @ObservedObject private var navigationCoordinator: DefaultNavigationCoordinator
    let properties: [Property]
    @State private var region: MKCoordinateRegion
    @State private var selectedProperty: Property?

    init(properties: [Property], navigationCoordinator: DefaultNavigationCoordinator ) {
        self.properties = properties
        self.navigationCoordinator = navigationCoordinator

        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 57.7080, longitude: 11.9746),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ))
    }
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                Button {
                    navigationCoordinator.navigate(to: .propertyDetail(id: annotation.id))
                } label: {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(.red)
                            .font(.title)
                        Text(annotation.name)
                            .font(.caption)
                            .padding(Layout.Padding.small)
                            .background(Color.white)
                            .cornerRadius(4)
                    }
                }
            }
        }
    }

    private var annotations: [PropertyAnnotation] {
        properties.compactMap { property in
            guard case .available(let latitude, let longitude) = property.location else {
                return nil
            }
            return PropertyAnnotation(
                id: property.id,
                name: property.name,
                coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            )
        }
    }
}

private struct PropertyAnnotation: Identifiable {
    let id: String
    let name: String
    let coordinate: CLLocationCoordinate2D
}
