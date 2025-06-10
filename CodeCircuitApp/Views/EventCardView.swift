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
        VStack {
            HStack {
                AsyncImage(url: event.logoUrl) { phase in
                    if let image = phase.image {
                        image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(4)
                    }
                }
                VStack(alignment: .leading) {
                    Text(event.name)
                        .font(.headline)
                    Text(event.description)
                        .font(.subheadline)
                }
                .lineLimit(2)
            }
            HStack {
                Text("\(event.organizer) · \(event.type.rawValue) · \(event.locationType.rawValue)")
                    .foregroundColor(.gray) // Optional: Style the dots and text together
                Spacer()
            }
            .padding(.vertical)
            .font(.footnote)
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
