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
               case .failure(let error):
                   print(error)
               }
           }
        }
    }
}
