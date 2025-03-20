//
//  Event.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import Foundation

struct Event: Identifiable, Hashable, Codable {
    let id: String
    
    
    // MARK: - General information
    
    let name: String
    let date: Date
    let technology: [String]
    let locationType: LocationType
    let type: EventType
    let description: String
    let days: Int
    var prizePool: Double?
    let entryFee: Double
    let currency: Currency
    let skillLevel: SkillLevel
    
    // MARK: - Optional location information
    
    var address: Address?
    var latitude: Double?
    var longitude: Double?
    
    
    // MARK: - Organizer information
    
    let organizer: String
    let website: URL
    let email: String
    let imageUrl: URL
    let logoUrl: URL
    
    // MARK: - Eligibility criteria
    
    var educationStatus: [EducationStatus]?
    let minimumAge: Int
    var maximumAge: Int?
    var minimumTeamSize: Int?
    var maximumTeamSize: Int?
    
    // MARK: - Enums
    
    enum LocationType: String, CaseIterable, Codable {
        case remote = "remote"
        case local = "local"
        case hybrid = "hybrid"
    }

    enum EventType: String, CaseIterable, Codable {
        case hackathon = "hackathon"
        case conference = "conference"
        case workshop = "workshop"
        case other = "other"
    }
    
    enum EducationStatus: String, CaseIterable, Codable {
        case nonStudent = "nonStudent"
        case primarySchoolStudent = "primarySchoolStudent"
        case secondarySchoolStudent = "secondarySchoolStudent"
        case higherEducationStudent = "higherEducationStudent"
        case postGraduate = "postGraduate"
    }
    
    enum SkillLevel: String, CaseIterable, Codable {
          case beginner = "beginner"
          case intermediate = "intermediate"
          case advanced = "advanced"
      }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case date
        case technology
        case locationType
        case type
        case description
        case days
        case entryFee
        case prizePool
        case currency
        case skillLevel
        case address
        case latitude
        case longitude
        case organizer
        case website
        case email
        case imageUrl
        case logoUrl
        case educationStatus
        case minimumAge
        case maximumAge
        case minimumTeamSize
        case maximumTeamSize
    }
}

extension Event {
    static let mockEvents: [Event] = [
        Event(
            id: "1",
            name: "Warsaw Web Development Weekend",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 8, day: 10))!,
            technology: ["HTML", "CSS", "JavaScript", "React"],
            locationType: .local,
            type: .hackathon,
            description: "Join fellow developers in Warsaw for an intense weekend of building amazing web applications.",
            days: 2,
            prizePool: 8000.00,
            entryFee: 30.00,
            currency: .pln,
            skillLevel: .intermediate,
            organizer: "Code Poland",
            website: URL(string:"https://codepoland.pl")!,
            email: "warsaw@codepoland.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/4CAF50/FFFFFF?Text=Warsaw%20Web%20Dev")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/4CAF50/FFFFFF?Text=CP")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .secondarySchoolStudent],
            minimumAge: 17,
            maximumAge: nil,
            minimumTeamSize: 1,
            maximumTeamSize: 4
        ),
        Event(
            id: "1",
            name: "Kraków Data Science Summit",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 25))!,
            technology: ["Python", "R", "Machine Learning", "Big Data"],
            locationType: .local,
            type: .conference,
            description: "Attend the premier Data Science Summit in Kraków and learn from industry leaders and researchers.",
            days: 3,
            entryFee: 299.00,
            currency: .pln,
            skillLevel: .advanced,
            organizer: "Data Science Kraków",
            website: URL(string:"https://dskrakow.com")!,
            email: "info@dskrakow.com",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/3F51B5/FFFFFF?Text=Kraków%20Data%20Sci")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/3F51B5/FFFFFF?Text=DSK")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .nonStudent],
            minimumAge: 18,
            maximumAge: nil
        ),
        Event(
            id: "1",
            name: "Łódź Game Development Jam",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 15))!,
            technology: ["Unity", "C#", "Game Design", "Art"],
            locationType: .local,
            type: .hackathon,
            description: "Join the game development community in Łódź for a weekend of creating exciting new games.",
            days: 3,
            prizePool: 5000.00,
            entryFee: 20.00,
            currency: .pln,
            skillLevel: .beginner,
            organizer: "GameDev Łódź",
            website: URL(string: "https://gamedevlodz.pl")!,
            email: "jam@gamedevlodz.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/9C27B0/FFFFFF?Text=Łódź%20Game%20Jam")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/9C27B0/FFFFFF?Text=GDL")!,
            educationStatus: [.secondarySchoolStudent, .higherEducationStudent, .postGraduate],
            minimumAge: 16,
            maximumAge: nil,
            minimumTeamSize: 1,
            maximumTeamSize: 3
        ),
        Event(
            id: "1",
            name: "Wrocław Cybersecurity Challenge",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 7, day: 5))!,
            technology: ["Networking", "Security", "Cryptography", "Linux"],
            locationType: .local,
            type: .hackathon,
            description: "Test your cybersecurity skills in the Wrocław Cybersecurity Challenge and compete for recognition.",
            days: 2,
            prizePool: 7000.00,
            entryFee: 40.00,
            currency: .pln,
            skillLevel: .advanced,
            organizer: "SecureWro",
            website: URL(string: "https://securewro.pl")!,
            email: "challenge@securewro.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/F44336/FFFFFF?Text=Wrocław%20Cyber")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/F44336/FFFFFF?Text=SW")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .nonStudent],
            minimumAge: 18,
            maximumAge: nil,
            minimumTeamSize: 4,
            maximumTeamSize: 4
        ),
        Event(
            id: "1",
            name: "Poznań Mobile Innovation Lab",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 10, day: 20))!,
            technology: ["iOS", "Android", "UI/UX", "Testing"],
            locationType: .local,
            type: .workshop,
            description: "A hands-on workshop in Poznań focused on the latest trends and techniques in mobile application development.",
            days: 1,
            entryFee: 79.99,
            currency: .pln,
            skillLevel: .intermediate,
            organizer: "Mobile Poznań",
            website: URL(string: "https://mobilepoznan.pl")!,
            email: "workshops@mobilepoznan.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/00BCD4/FFFFFF?Text=Poznań%20Mobile%20Lab")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/00BCD4/FFFFFF?Text=MP")!,
            educationStatus: [.secondarySchoolStudent, .higherEducationStudent, .nonStudent],
            minimumAge: 16,
            maximumAge: nil
        ),
        Event(
            id: "1",
            name: "Gdańsk AI and Robotics Expo",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 5))!,
            technology: ["AI", "Robotics", "Automation", "Sensors"],
            locationType: .local,
            type: .conference,
            description: "Explore the cutting edge of Artificial Intelligence and Robotics at this expo in Gdańsk.",
            days: 2,
            entryFee: 149.00,
            currency: .pln,
            skillLevel: .beginner,
            organizer: "Tech Coast Gdańsk",
            website: URL(string: "https://techcoastgdansk.pl")!,
            email: "expo@techcoastgdansk.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/673AB7/FFFFFF?Text=Gdańsk%20AI%20Expo")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/673AB7/FFFFFF?Text=TCG")!,
            educationStatus: [.nonStudent, .secondarySchoolStudent, .higherEducationStudent, .postGraduate, .nonStudent],
            minimumAge: 15,
            maximumAge: nil
        ),
        Event(
            id: "1",
            name: "Szczecin Startup Weekend",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 11, day: 3))!,
            technology: ["Business", "Marketing", "Web Development", "Pitching"],
            locationType: .local,
            type: .hackathon,
            description: "Launch your startup idea in a single weekend in Szczecin! Collaborate, build, and pitch your vision.",
            days: 3,
            prizePool: 3000.00,
            entryFee: 60.00,
            currency: .pln,
            skillLevel: .beginner,
            organizer: "Startup Szczecin",
            website: URL(string: "https://startupszczecin.pl")!,
            email: "weekend@startupszczecin.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/FFC107/000000?Text=Szczecin%20Startup")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/FFC107/000000?Text=SS")!,
            educationStatus: [.nonStudent, .secondarySchoolStudent, .higherEducationStudent, .postGraduate, .nonStudent],
            minimumAge: 16,
            maximumAge: nil,
            minimumTeamSize: 3,
            maximumTeamSize: 4
        ),
        Event(
            id: "1",
            name: "Lublin Cloud Technologies Forum",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 15))!,
            technology: ["AWS", "Azure", "Google Cloud", "DevOps"],
            locationType: .local,
            type: .conference,
            description: "Discuss the latest advancements and best practices in cloud computing at the Lublin forum.",
            days: 2,
            entryFee: 179.00,
            currency: .pln,
            skillLevel: .intermediate,
            organizer: "Cloud Lublin",
            website: URL(string: "https://cloudlublin.pl")!,
            email: "forum@cloudlublin.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/03A9F4/FFFFFF?Text=Lublin%20Cloud%20Forum")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/03A9F4/FFFFFF?Text=CL")!,
            educationStatus: [.higherEducationStudent, .postGraduate, .nonStudent],
            minimumAge: 18,
            maximumAge: nil
        ),
        Event(
            id: "1",
            name: "Bydgoszcz IoT Innovation Challenge",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 8))!,
            technology: ["IoT", "Sensors", "Embedded Systems", "Data Analytics"],
            locationType: .local,
            type: .hackathon,
            description: "Innovate with the Internet of Things in Bydgoszcz! Tackle real-world challenges using IoT technologies.",
            days: 2,
            prizePool: 6000.00,
            entryFee: 25.00,
            currency: .pln,
            skillLevel: .intermediate,
            organizer: "IoT Bydgoszcz",
            website: URL(string: "https://iotbydgoszcz.pl")!,
            email: "challenge@iotbydgoszcz.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/795548/FFFFFF?Text=Bydgoszcz%20IoT")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/795548/FFFFFF?Text=IB")!,
            educationStatus: [.secondarySchoolStudent, .higherEducationStudent, .postGraduate],
            minimumAge: 16,
            maximumAge: nil,
            minimumTeamSize: 2,
            maximumTeamSize: 4
        ),
        Event(
            id: "1",
            name: "Rzeszów Future of Frontend Meetup",
            date: Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 25))!,
            technology: ["React", "Angular", "Vue.js", "TypeScript"],
            locationType: .local,
            type: .other,
            description: "Join frontend developers in Rzeszów to discuss the latest trends and future of web development.",
            days: 1,
            entryFee: 0.00,
            currency: .pln,
            skillLevel: .intermediate,
            organizer: "Frontend Rzeszów",
            website: URL(string: "https://frontendrzeszow.pl")!,
            email: "meetup@frontendrzeszow.pl",
            imageUrl: URL(string: "https://via.placeholder.com/800x400/E91E63/FFFFFF?Text=Rzeszów%20Frontend")!,
            logoUrl: URL(string: "https://via.placeholder.com/100x100/E91E63/FFFFFF?Text=FR")!,
            educationStatus: [.nonStudent, .secondarySchoolStudent, .higherEducationStudent, .postGraduate, .nonStudent],
            minimumAge: 15,
            maximumAge: nil
        )
    ]
}
