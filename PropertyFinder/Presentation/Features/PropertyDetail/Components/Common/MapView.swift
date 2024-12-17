//
//  MapView.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 08.12.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    let location: Location
    @State private var region: MKCoordinateRegion

    init(location: Location) {
        self.location = location

        switch location {
        case .available(let latitude, let longitude):
            _region = State(initialValue: MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01
                )
            ))
        case .unavailable:
            _region = State(initialValue: MKCoordinateRegion())
        }
    }
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
            MapMarker(coordinate: annotation.coordinate)
        }
        .frame(height: 200)
    }

    private var annotations: [MapAnnotation] {
        switch location {
        case .available(let latitude, let longitude):
            return [MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))]
        case .unavailable:
            return []
        }
    }
}

private struct MapAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
