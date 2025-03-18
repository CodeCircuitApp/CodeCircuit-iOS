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
        ScrollView {
            VStack {
                headerArea
                HStack {
                    Text(event.description)
                        .padding()
                    Spacer()
                }
                    .multilineTextAlignment(.leading)
                actionButtons
                details
                Spacer()
            }
            .padding(.bottom, 72.0)

        }
        .toolbarBackground(.hidden, for: .navigationBar) 
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
    
    var actionButtons: some View {
        HStack {
            EventActionButton(systemName: "safari", text: "Website", action: { openWebsite(url: event.website) })
            EventActionButton(systemName: "square.and.arrow.up", text: "Share", action: { print("Call") })
        }
    }
    
    @ViewBuilder
    var details: some View {

        let entryFeeValue = String(format: "%.2f %@", event.entryFee, event.currency.rawValue)
        let prizePoolValue = "\(Int(event.prizePool)) \(event.currency.rawValue)"
        let durationValue = "\(event.days) \(event.days == 1 ? "day" : "days")"
        
        VStack {
            HStack {
                Text("Event Details")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                EventDetailCell(label: "Date", text: event.date.formatted())
                EventDetailCell(label: "Entry Fee", text: entryFeeValue)
                EventDetailCell(label: "Prize Pool", text: prizePoolValue)
                EventDetailCell(label: "Duration", text: durationValue)
                EventDetailCell(label: "Skill Level", text: "Beginners")
                EventDetailCell(label: "Format", text: "Local")
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack(path: .constant([Event.mockEvents.first!])) {
        Text("Initial View")
            .navigationDestination(for: Event.self) { event in
                EventView(event: event)
            }
            .navigationTitle("Preview Home")
    }
}
