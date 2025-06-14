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
                CachedImage(url: event.logoUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 50)
                            .padding(4)
                    case .success(let image):
                        image
                            .frame(width: 50, height: 50)
                            .padding(4)
                    case .failure(let error):
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundStyle(.gray)
                            .frame(width: 50, height: 50)
                            .padding(4)
                    @unknown default:
                        EmptyView()
                    }
                    
                }
//                    .frame(width: 50, height: 50)
//                    .padding(4)
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
    ContentView()
        .environment(EventViewModel())
}
