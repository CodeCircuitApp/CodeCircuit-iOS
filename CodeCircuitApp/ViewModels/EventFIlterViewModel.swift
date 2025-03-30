//
//  EventFIlterViewModel.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 24/03/2025.
//

import SwiftUI

@Observable class EventFilterViewModel {
    private(set) var filters = Filters()
    
    var types: Set<Event.EventType> = []
    var locationTypes: Set<Event.LocationType> = []
    var educationStatuses: Set<Event.EducationStatus> = []
    var entryFee: Bool? = nil
    var prizePool: Bool? = nil
    var minAge: Int? = nil
    var maxAge: Int? = nil
    var minTeamSize: Int? = nil
    var maxTeamSize: Int? = nil
    
    func updateFilters(types: Set<Event.EventType>, locationTypes: Set<Event.LocationType>, educationStatuses: Set<Event.EducationStatus>, entryFee: Bool?, prizePool: Bool?, minAge: Int?, maxAge: Int?, minTeamSize: Int?, maxTeamSize: Int?) {
        filters.types = types
        filters.locationTypes = locationTypes
        filters.educationStatuses = educationStatuses
        filters.entryFee = entryFee
        filters.prizePool = prizePool
        filters.minAge = minAge
        filters.maxAge = maxAge
        filters.minTeamSize = minTeamSize
        filters.maxTeamSize = maxTeamSize
    }

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
