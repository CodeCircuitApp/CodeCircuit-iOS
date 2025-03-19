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
    
    var body: some View {
        Map {
            Marker("Warsaw University Hackathon 2025", coordinate: coordinate)
        }
    }
}

#Preview {
    MapView()
}
