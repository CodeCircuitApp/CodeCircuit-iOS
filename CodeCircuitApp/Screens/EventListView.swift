//
//  EventListView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct EventListView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(Event.mockEvents) { event in
                    NavigationLink(value: event) {
                        EventCardView(event: event)
                    }
                }
            }
            .navigationDestination(for: Event.self) { event in
                EventView(event: event)
            }
            .navigationTitle("Events")
        }
    }
}

#Preview {
    EventListView()
}
