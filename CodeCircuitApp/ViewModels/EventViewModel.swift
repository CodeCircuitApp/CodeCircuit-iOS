//
//  EventViewModel.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 21/03/2025.
//

import SwiftUI

@Observable class EventViewModel {
    var events: [Event] = []
    var networkError: CCError? = nil
    var isFetching = false
    var gotAllEvents = false
    
    var hasError: Bool {
        return networkError != nil
    }
    
    func fetchEvents(sizePerPage: Int, page: Binding<Int>) {
        isFetching = true
        Task {
            await NetworkManager.shared.getEvents(sizePerPage: sizePerPage, page: page.wrappedValue) { result in
                switch result {
                case .success(let events):
                    if events.count < sizePerPage {
                        self.gotAllEvents = true
                    }
                    page.wrappedValue += 1
                    self.events.append(contentsOf: events)
                    self.saveEvents()
                case .failure(let error):
                    self.networkError = error
                    self.loadEvents()
                }
                self.isFetching = false
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
