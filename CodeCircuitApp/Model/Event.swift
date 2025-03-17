//
//  Event.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    
    let name: String
    let date: Date
    let eventLocationType: EventLocationType
    let eventType: EventType
    let description: String
    
    enum EventLocationType {
        case remote, local, hybrid
    }

    enum EventType {
        case hackathon, conference, workshop, other
    }
}

extension Event {
    static let mockEvents: [Event] = [
        Event(name: "Warsaw City Hackathon Week", date: DateComponents(calendar: .current, year: 2025, month: 6, day: 15).date!, eventLocationType: .local, eventType: .hackathon, description: "Compete and learn in the first edition of Warsaw City Hackathon. It is a week of workshops, conferences, and hackathons."),
        
        Event(name: "Kraków AI Conference", date: DateComponents(calendar: .current, year: 2025, month: 4, day: 10).date!, eventLocationType: .local, eventType: .conference, description: "Discover the latest advancements in AI with top researchers and industry leaders in Kraków."),
        
        Event(name: "Gdańsk Dev Networking Night", date: DateComponents(calendar: .current, year: 2025, month: 5, day: 22).date!, eventLocationType: .local, eventType: .other, description: "A networking event for developers and tech professionals in Gdańsk."),
        
        Event(name: "Wrocław Startup Hack", date: DateComponents(calendar: .current, year: 2025, month: 7, day: 8).date!, eventLocationType: .local, eventType: .hackathon, description: "A hackathon bringing together entrepreneurs and developers to create innovative startup ideas."),
        
        Event(name: "Poznań Mobile Dev Summit", date: DateComponents(calendar: .current, year: 2025, month: 9, day: 14).date!, eventLocationType: .local, eventType: .conference, description: "Join top mobile developers to discuss the future of iOS and Android development in Poznań."),
        
        Event(name: "Łódź Blockchain Expo", date: DateComponents(calendar: .current, year: 2025, month: 10, day: 5).date!, eventLocationType: .local, eventType: .conference, description: "A conference dedicated to blockchain innovations and decentralized applications in Łódź."),
        
        Event(name: "Katowice Cloud Computing Bootcamp", date: DateComponents(calendar: .current, year: 2025, month: 3, day: 18).date!, eventLocationType: .local, eventType: .workshop, description: "A hands-on workshop covering the latest trends in cloud computing in Katowice."),
        
        Event(name: "Szczecin Women in Tech Meetup", date: DateComponents(calendar: .current, year: 2025, month: 8, day: 25).date!, eventLocationType: .local, eventType: .other, description: "A meetup focused on empowering women in the tech industry in Szczecin."),
        
        Event(name: "Lublin Game Dev Jam", date: DateComponents(calendar: .current, year: 2025, month: 11, day: 12).date!, eventLocationType: .local, eventType: .hackathon, description: "Game developers from Poland gather in Lublin to build new games in a 48-hour challenge."),
        
        Event(name: "Bydgoszcz Cybersecurity Week", date: DateComponents(calendar: .current, year: 2025, month: 12, day: 2).date!, eventLocationType: .local, eventType: .conference, description: "A week-long event in Bydgoszcz focusing on cybersecurity, ethical hacking, and online privacy.")
    ]
}
