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
    @State private var eventFilterViewModel = EventFilterViewModel()
    let events: [Event]
    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 52.240225, longitude: 21.018661)
    let initialPosition: MapCameraPosition = MapCameraPosition.camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 51.919400, longitude: 19.145100), distance: 1500000))
    @State var showFilterView = false
    @State var viewDidLoad = false
    
    var body: some View {
        NavigationStack {
            Map(initialPosition: initialPosition) {
                ForEach(events) { event in
                    if let latitude = event.latitude, let longitude = event.longitude {
                        Annotation(event.name, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)) {
                            NavigationLink(value: event) {
                                 VStack(spacing: 4) {
                                     Image(systemName: "star.circle")
                                         .resizable()
                                         .frame(width: 30, height: 30)
                                         .foregroundColor(.red)
                                         .background(.white)
                                         .clipShape(.circle)
                                 }
                             }
                        }
                    }
                }
            }
            .sheet(isPresented: $showFilterView) {
                FilterView(showFilterView: $showFilterView, viewModel: eventFilterViewModel) {
                    eventViewModel.events.removeAll()
                    eventViewModel.fetchEvents(sizePerPage: 1000, page: nil, filters: eventFilterViewModel.filters)
                }
                .presentationDetents([.medium])
            }
            .navigationDestination(for: Event.self) { event in
                EventView(event: event)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showFilterView = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .onAppear {
                if !viewDidLoad {
                    eventViewModel.fetchAllEvents()
                    viewDidLoad = true
                }
            }
        }
    }
}

#Preview {
    MapView(events: Event.mockEvents)
        .environment(EventViewModel())
}
