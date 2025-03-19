//
//  ContentView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Explore", systemImage: "safari") {
                EventListView()
            }
            Tab("Map", systemImage: "map") {
                MapView()
            }
        }
    }
}

#Preview {
    ContentView()
}
