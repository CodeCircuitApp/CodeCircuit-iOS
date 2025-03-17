//
//  EventCardView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct EventCardView: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image("placeholder-event-image")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.headline)
                Text(event.description)
                    .font(.subheadline)
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    List {
        EventCardView(event: Event.mockEvents[0])
        EventCardView(event: Event.mockEvents[1])
        EventCardView(event: Event.mockEvents[2])
        EventCardView(event: Event.mockEvents[3])
    }
}
