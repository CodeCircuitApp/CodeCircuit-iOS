//
//  EventView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct EventView: View {
    let viewModel = EventViewViewModel()
    
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
                eligibilityCriteria
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
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(event.type.rawValue.lowercased()) · \(event.locationType.rawValue.lowercased()) · \(event.entryFee == 0 ? "free" : "paid")")
                                .font(.callout)
                            Spacer()
                        }
                        Text(event.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .foregroundStyle(.white)
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
            EventActionButton(systemName: "envelope", text: "E-mail", action: { print("Call") })
            EventActionButton(systemName: "square.and.arrow.up", text: "Share", action: { print("Call") })
            EventActionButton(systemName: "calendar.badge.plus", text: "Save", action: { viewModel.saveToCalendar(event: event) })
        }
    }
    
    @ViewBuilder
    var details: some View {

        let entryFeeValue = event.entryFee == 0.00 ? "Free" : String(format: "%.2f %@", event.entryFee, event.currency.rawValue)
        let prizePoolValue = "\(Int(event.prizePool ?? 0)) \(event.currency.rawValue)"
        let durationValue = "\(event.days) \(event.days == 1 ? "day" : "days")"
        let teamSizeValue: String = {
            guard let minSize = event.minimumTeamSize, let maxSize = event.maximumTeamSize else {
                return "Unspecified"
            }
            
            let isRange = minSize != maxSize

            return isRange ? "\(minSize) - \(maxSize)" : "\(minSize)"
        }()
        
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
                event.prizePool != nil ? EventDetailCell(label: "Prize Pool", text: prizePoolValue) : nil
                EventDetailCell(label: "Duration", text: durationValue)
                EventDetailCell(label: "Skill Level", text: event.skillLevel.rawValue)
                EventDetailCell(label: "Format", text: event.type.rawValue)
                event.type == .hackathon ? EventDetailCell(label: "Team Size", text: teamSizeValue) : nil
            }
        }
        .padding()
    }
    
    @ViewBuilder
    var eligibilityCriteria: some View {
        let educationEligibilityLabel = EligibilityLabel.getEligibleLabel(from: event.educationStatus)
        let educationIneligibilityLabel = EligibilityLabel.getIneligibleLabel(excluding: event.educationStatus)
        let ageEligibilityLabel = EligibilityLabel.getEligibleLabel(minimumAge: event.minimumAge, maximumAge: event.maximumAge)
        let ageIneligbilityLabel = EligibilityLabel.getIneligibleLabel(minimumAge: event.minimumAge, maximumAge: event.maximumAge)
        
        VStack(spacing: 8) {
            HStack {
                Text("Eligbility Criteria")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            if event.type == .hackathon {
                EligibilityCriteriaView(criteriaLabel: "Education Status", eligibleLabel: educationEligibilityLabel, ineligibleLabel: educationIneligibilityLabel)
            }
            EligibilityCriteriaView(criteriaLabel: "Age Requirements", eligibleLabel: ageEligibilityLabel, ineligibleLabel: ageIneligbilityLabel)
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

#Preview {
    EventView(event: Event.mockEvents[4])
}
