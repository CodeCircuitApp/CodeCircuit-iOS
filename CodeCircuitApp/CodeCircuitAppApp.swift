//
//  CodeCircuitAppApp.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

@main
struct CodeCircuitAppApp: App {
    @State private var eventViewModel = EventViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(eventViewModel)
        }
    }
}
