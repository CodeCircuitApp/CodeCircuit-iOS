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
        .alert(isPresented: .constant(eventViewModel.hasError)) {
            Alert(title: Text("An error occured"), message: Text(eventViewModel.networkError?.localizedDescription ?? "Unexpected error. Please try again."), dismissButton: .default(Text("Ok"), action: {eventViewModel.networkError = nil}))
        }
    }
}

#Preview {
    ContentView()
        .environment(EventViewModel())
}
