//
//  EventFIlterViewModel.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 24/03/2025.
//

import SwiftUI

@Observable class EventFilterViewModel {
    var types: Set<Event.EventType> = []
    var locationTypes: Set<Event.LocationType> = []
    var educationStatuses: Set<Event.EducationStatus> = []
    var entryFee: Bool? = nil
    var prizePool: Bool? = nil
    var minAge: Int? = nil
    var maxAge: Int? = nil
    var minTeamSize: Int? = nil
    var maxTeamSize: Int? = nil

    func resetFilters() {
        types.removeAll()
        locationTypes.removeAll()
        educationStatuses.removeAll()
        entryFee = nil
        prizePool = nil
        minAge = nil
        maxAge = nil
        minTeamSize = nil
        maxTeamSize = nil
    }
}
