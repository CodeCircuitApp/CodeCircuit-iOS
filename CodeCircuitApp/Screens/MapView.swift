//
//  MapView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 19/03/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(EventViewModel.self) private var eventViewModel: EventViewModel
    let events: [Event]
    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 52.240225, longitude: 21.018661)
    let initialPosition: MapCameraPosition = MapCameraPosition.camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 51.919400, longitude: 19.145100), distance: 1500000))
    
    var body: some View {
        NavigationStack {
            Map(initialPosition: initialPosition) {
                ForEach(events) { event in
                    if let latitude = event.latitude, let longitude = event.longitude {
                        Annotation(event.name, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)) {
                            NavigationLink(value: event) {
                                 VStack(spacing: 4) {
                                     Image(systemName: "mappin.circle.fill")
                                         .resizable()
                                         .frame(width: 30, height: 30)
                                         .foregroundColor(.red)
                                 }
                             }
                        }
                    }
                }
            }
            .navigationDestination(for: Event.self) { event in
                EventView(event: event)
            }
            .onAppear {
                eventViewModel.fetchAllEvents()
            }
        }
    }
}

#Preview {
    MapView(events: Event.mockEvents)
        .environment(EventViewModel())
}
