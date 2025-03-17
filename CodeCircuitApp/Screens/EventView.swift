//
//  EventView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct EventView: View {
    let event: Event
    
    var body: some View {
        VStack {
            headerArea
            Text(event.description)
                .padding()
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    var headerArea: some View {
        ZStack(alignment: .bottomLeading) {
            Image(.mockEvent)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
            dateLabel
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors:
                                                [Color.accentColor.opacity(0),
                                                 Color.accentColor.opacity(0.6),
                                                Color.accentColor]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: 250)
                HStack {
                    Text(event.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
        }
        .frame(height: 500)
    }
    
    var dateLabel: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text(event.date.formatted())
                    .font(.caption)
                    .padding(8)
                    .background(Color.accentColor)
                    .foregroundStyle(.white)
                    .cornerRadius(50)
                    .offset(x: -30, y: 70)
                
                Spacer()
            }
        }
    }
}

#Preview {
    EventView(event: Event.mockEvents.first!)
}
