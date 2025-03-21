//
//  ContentView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(EventViewModel.self) private var eventViewModel: EventViewModel
    @State var showAlert = true
    
    var body: some View {
        TabView {
            Tab("Explore", systemImage: "safari") {
                EventListView(events: eventViewModel.events)
            }
            Tab("Map", systemImage: "map") {
                MapView()
            }
        }
        .alert("Alert", isPresented: .constant(eventViewModel.hasError)) {
            Button {
                print("tap")
                eventViewModel.networkError = nil
            } label: {
                Text("Dismiss")
            }
        }
        .onAppear { eventViewModel.fetchEvents() }
    }
}

#Preview {
    ContentView()
        .environment(EventViewModel())
}
