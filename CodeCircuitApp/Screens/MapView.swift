//
//  MapView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 19/03/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 52.240225, longitude: 21.018661)
    let initialPosition: MapCameraPosition = MapCameraPosition.camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 51.919400, longitude: 19.145100), distance: 1500000))
    
    var body: some View {
        Map(initialPosition: initialPosition) {
            Marker("Warsaw University Hackathon 2025", coordinate: coordinate)
        }
    }
}

#Preview {
    MapView()
}
