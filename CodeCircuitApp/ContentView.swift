//
//  ContentView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(EventViewModel.self) var eventViewModel: EventViewModel
    
    var body: some View {
        TabView {
            Tab("Explore", systemImage: "safari") {
                EventListView(events: eventViewModel.events)
            }
            Tab("Map", systemImage: "map") {
                MapView()
            }
        }
        .onAppear { eventViewModel.fetchEvents() }
    }
}

#Preview {
    ContentView()
        .environment(EventViewModel())
}
