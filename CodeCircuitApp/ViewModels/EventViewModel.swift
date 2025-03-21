//
//  EventViewModel.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 21/03/2025.
//

import SwiftUI

@Observable class EventViewModel {
    var events: [Event] = []
    
    func fetchEvents() {
        Task {
            await NetworkManager.shared.getAllEvents { result in
               switch result {
               case .success(let events):
                   self.events = events
                   self.saveEvents()
               case .failure(let error):
                   print(error)
                   self.loadEvents()
               }
           }
        }
    }
    
    func saveEvents() {
        do {
            let data = try JSONEncoder().encode(events)
            try data.write(to: URL(fileURLWithPath: "/tmp/events.json"))
        } catch {
            print("Failed to save: \(error)")
        }
    }
    
    func loadEvents() {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: "/tmp/events.json"))
            let events = try JSONDecoder().decode([Event].self, from: data)
            self.events = events
        } catch {
            print("Failed to load: \(error)")
        }
    }
}
