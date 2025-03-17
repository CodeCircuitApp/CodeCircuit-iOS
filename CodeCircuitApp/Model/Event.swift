//
//  Event.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import Foundation

struct Event: Identifiable, Hashable {
    let id = UUID()
    
    // MARK: - General information
    
    let name: String
    let date: Date
    let technology: [String]
    let eventLocationType: EventLocationType
    let eventType: EventType
    let description: String
    let days: Int
    let prizePool: Double
    let entryFee: Double
    let currency: Currency
    
    
    // MARK: - Organizer information
    
    let organizer: String
    let website: String
    let email: String
    let imageURL: URL
    let logo: URL
    
    // MARK: - Eligibility criteria
    
    let educationStatus: [EducationStatus]
    let minimumAge: Int
    let maximumAge: Int?
    let skillLevel: SkillLevel
    
    // MARK: - Enums
    
    enum EventLocationType: String, CaseIterable {
        case remote = "Remote"
        case local = "Local"
        case hybrid = "Hybrid"
    }

    enum EventType: String, CaseIterable {
        case hackathon = "Hackathon"
        case conference = "Conference"
        case workshop = "Workshop"
        case other = "Other"
    }
    
    enum EducationStatus: String, CaseIterable {
        case none = "None"
        case primarySchoolStudent = "Primary School Student"
        case secondarySchoolStudent = "Secondary School Student"
        case higherEducationStudent = "Higher Education Student"
        case postGraduate = "Post-Graduate"
        case employedProfessional = "Employed Professional"
    }
    
    enum SkillLevel: String, CaseIterable {
          case beginner = "Beginner"
          case intermediate = "Intermediate"
          case advanced = "Advanced"
      }
}

extension Event {
    static let mockEvents: [Event] = [
        Event(
            name: "Warsaw Web Development Weekend",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 8, day: 10))!,
            technology: ["HTML", "CSS", "JavaScript", "React"],
            eventLocationType: .local,
            eventType: .hackathon,
            description: "Join fellow developers in Warsaw for an intense weekend of building amazing web applications.",
            days: 2,
            prizePool: 8000.00,
            entryFee: 30.00,
            currency: .pln,
            organizer: "Code Poland",
            website: "https://codepoland.pl",
            email: "warsaw@codepoland.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/4CAF50/FFFFFF?Text=Warsaw%20Web%20Dev")!,
            logo: URL(string: "https://via.placeholder.com/100x100/4CAF50/FFFFFF?Text=CP")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .secondarySchoolStudent],
            minimumAge: 17,
            maximumAge: nil,
            skillLevel: .intermediate
        ),
        Event(
            name: "Kraków Data Science Summit",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 25))!,
            technology: ["Python", "R", "Machine Learning", "Big Data"],
            eventLocationType: .local,
            eventType: .conference,
            description: "Attend the premier Data Science Summit in Kraków and learn from industry leaders and researchers.",
            days: 3,
            prizePool: 0.00,
            entryFee: 299.00,
            currency: .pln,
            organizer: "Data Science Kraków",
            website: "https://dskrakow.com",
            email: "info@dskrakow.com",
            imageURL: URL(string: "https://via.placeholder.com/800x400/3F51B5/FFFFFF?Text=Kraków%20Data%20Sci")!,
            logo: URL(string: "https://via.placeholder.com/100x100/3F51B5/FFFFFF?Text=DSK")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .none],
            minimumAge: 18,
            maximumAge: nil,
            skillLevel: .advanced
        ),
        Event(
            name: "Łódź Game Development Jam",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 15))!,
            technology: ["Unity", "C#", "Game Design", "Art"],
            eventLocationType: .local,
            eventType: .hackathon,
            description: "Join the game development community in Łódź for a weekend of creating exciting new games.",
            days: 3,
            prizePool: 5000.00,
            entryFee: 20.00,
            currency: .pln,
            organizer: "GameDev Łódź",
            website: "https://gamedevlodz.pl",
            email: "jam@gamedevlodz.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/9C27B0/FFFFFF?Text=Łódź%20Game%20Jam")!,
            logo: URL(string: "https://via.placeholder.com/100x100/9C27B0/FFFFFF?Text=GDL")!,
            educationStatus: [.secondarySchoolStudent, .higherEducationStudent, .postGraduate],
            minimumAge: 16,
            maximumAge: nil,
            skillLevel: .beginner
        ),
        Event(
            name: "Wrocław Cybersecurity Challenge",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 7, day: 5))!,
            technology: ["Networking", "Security", "Cryptography", "Linux"],
            eventLocationType: .local,
            eventType: .hackathon,
            description: "Test your cybersecurity skills in the Wrocław Cybersecurity Challenge and compete for recognition.",
            days: 2,
            prizePool: 7000.00,
            entryFee: 40.00,
            currency: .pln,
            organizer: "SecureWro",
            website: "https://securewro.pl",
            email: "challenge@securewro.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/F44336/FFFFFF?Text=Wrocław%20Cyber")!,
            logo: URL(string: "https://via.placeholder.com/100x100/F44336/FFFFFF?Text=SW")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .employedProfessional],
            minimumAge: 18,
            maximumAge: nil,
            skillLevel: .advanced
        ),
        Event(
            name: "Poznań Mobile Innovation Lab",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 10, day: 20))!,
            technology: ["iOS", "Android", "UI/UX", "Testing"],
            eventLocationType: .local,
            eventType: .workshop,
            description: "A hands-on workshop in Poznań focused on the latest trends and techniques in mobile application development.",
            days: 1,
            prizePool: 0.00,
            entryFee: 79.99,
            currency: .pln,
            organizer: "Mobile Poznań",
            website: "https://mobilepoznan.pl",
            email: "workshops@mobilepoznan.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/00BCD4/FFFFFF?Text=Poznań%20Mobile%20Lab")!,
            logo: URL(string: "https://via.placeholder.com/100x100/00BCD4/FFFFFF?Text=MP")!,
            educationStatus: [.secondarySchoolStudent, .higherEducationStudent, .employedProfessional],
            minimumAge: 16,
            maximumAge: nil,
            skillLevel: .intermediate
        ),
        Event(
            name: "Gdańsk AI and Robotics Expo",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 5))!,
            technology: ["AI", "Robotics", "Automation", "Sensors"],
            eventLocationType: .local,
            eventType: .conference,
            description: "Explore the cutting edge of Artificial Intelligence and Robotics at this expo in Gdańsk.",
            days: 2,
            prizePool: 0.00,
            entryFee: 149.00,
            currency: .pln,
            organizer: "Tech Coast Gdańsk",
            website: "https://techcoastgdansk.pl",
            email: "expo@techcoastgdansk.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/673AB7/FFFFFF?Text=Gdańsk%20AI%20Expo")!,
            logo: URL(string: "https://via.placeholder.com/100x100/673AB7/FFFFFF?Text=TCG")!,
            educationStatus: [.none, .secondarySchoolStudent, .higherEducationStudent, .postGraduate, .employedProfessional],
            minimumAge: 15,
            maximumAge: nil,
            skillLevel: .beginner
        ),
        Event(
            name: "Szczecin Startup Weekend",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 11, day: 3))!,
            technology: ["Business", "Marketing", "Web Development", "Pitching"],
            eventLocationType: .local,
            eventType: .hackathon,
            description: "Launch your startup idea in a single weekend in Szczecin! Collaborate, build, and pitch your vision.",
            days: 3,
            prizePool: 3000.00,
            entryFee: 60.00,
            currency: .pln,
            organizer: "Startup Szczecin",
            website: "https://startupszczecin.pl",
            email: "weekend@startupszczecin.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/FFC107/000000?Text=Szczecin%20Startup")!,
            logo: URL(string: "https://via.placeholder.com/100x100/FFC107/000000?Text=SS")!,
            educationStatus: [.none, .secondarySchoolStudent, .higherEducationStudent, .postGraduate, .employedProfessional],
            minimumAge: 16,
            maximumAge: nil,
            skillLevel: .beginner
        ),
        Event(
            name: "Lublin Cloud Technologies Forum",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 15))!,
            technology: ["AWS", "Azure", "Google Cloud", "DevOps"],
            eventLocationType: .local,
            eventType: .conference,
            description: "Discuss the latest advancements and best practices in cloud computing at the Lublin forum.",
            days: 2,
            prizePool: 0.00,
            entryFee: 179.00,
            currency: .pln,
            organizer: "Cloud Lublin",
            website: "https://cloudlublin.pl",
            email: "forum@cloudlublin.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/03A9F4/FFFFFF?Text=Lublin%20Cloud%20Forum")!,
            logo: URL(string: "https://via.placeholder.com/100x100/03A9F4/FFFFFF?Text=CL")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .employedProfessional],
            minimumAge: 18,
            maximumAge: nil,
            skillLevel: .intermediate
        ),
        Event(
            name: "Bydgoszcz IoT Innovation Challenge",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 8))!,
            technology: ["IoT", "Sensors", "Embedded Systems", "Data Analytics"],
            eventLocationType: .local,
            eventType: .hackathon,
            description: "Innovate with the Internet of Things in Bydgoszcz! Tackle real-world challenges using IoT technologies.",
            days: 2,
            prizePool: 6000.00,
            entryFee: 25.00,
            currency: .pln,
            organizer: "IoT Bydgoszcz",
            website: "https://iotbydgoszcz.pl",
            email: "challenge@iotbydgoszcz.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/795548/FFFFFF?Text=Bydgoszcz%20IoT")!,
            logo: URL(string: "https://via.placeholder.com/100x100/795548/FFFFFF?Text=IB")!,
            educationStatus: [.secondarySchoolStudent, .higherEducationStudent, .postGraduate],
            minimumAge: 16,
            maximumAge: nil,
            skillLevel: .intermediate
        ),
        Event(
            name: "Rzeszów Future of Frontend Meetup",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 25))!,
            technology: ["React", "Angular", "Vue.js", "TypeScript"],
            eventLocationType: .local,
            eventType: .other,
            description: "Join frontend developers in Rzeszów to discuss the latest trends and future of web development.",
            days: 1,
            prizePool: 0.00,
            entryFee: 0.00,
            currency: .pln,
            organizer: "Frontend Rzeszów",
            website: "https://frontendrzeszow.pl",
            email: "meetup@frontendrzeszow.pl",
            imageURL: URL(string: "https://via.placeholder.com/800x400/E91E63/FFFFFF?Text=Rzeszów%20Frontend")!,
            logo: URL(string: "https://via.placeholder.com/100x100/E91E63/FFFFFF?Text=FR")!,
            educationStatus: [.none, .secondarySchoolStudent, .higherEducationStudent, .postGraduate, .employedProfessional],
            minimumAge: 15,
            maximumAge: nil,
            skillLevel: .intermediate
        )
    ]
}
