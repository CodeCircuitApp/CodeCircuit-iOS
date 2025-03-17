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
            Tab("Events", systemImage: "backpack") {
                EventListView()
            }
            Tab("Map", systemImage: "map") {
                Text("Map")
            }
        }
    }
}

#Preview {
    ContentView()
}
