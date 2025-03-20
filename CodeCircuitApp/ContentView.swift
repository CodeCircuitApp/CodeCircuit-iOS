//
//  ContentView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var events = [Event]()
    
    var body: some View {
        TabView {
            Tab("Explore", systemImage: "safari") {
                EventListView(events: events)
            }
            Tab("Map", systemImage: "map") {
                MapView()
            }
        }
        .onAppear {
            Task {
                await NetworkManager.shared.getAllEvents { result in
                    switch result {
                    case . success(let events):
                        print(events)
                        self.events = events
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
