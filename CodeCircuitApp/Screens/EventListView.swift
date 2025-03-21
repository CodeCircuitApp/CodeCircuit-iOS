//
//  EventListView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct EventListView: View {
    @Environment(EventViewModel.self) private var eventViewModel: EventViewModel
    
    let events: [Event]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(events) { event in
                    NavigationLink(value: event) {
                        EventCardView(event: event)
                    }
                }
            }
            .refreshable {
                eventViewModel.fetchEvents()
            }
            .navigationDestination(for: Event.self) { event in
                EventView(event: event)
            }
            .navigationTitle("Events")
        }
    }
}

#Preview {
    EventListView(events: Event.mockEvents)
}
