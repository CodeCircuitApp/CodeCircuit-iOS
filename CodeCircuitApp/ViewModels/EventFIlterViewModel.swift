//
//  EventFIlterViewModel.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 24/03/2025.
//

import SwiftUI

@Observable class EventFilterViewModel {
    private(set) var filters = Filters()
    
    func updateFilters(types: Set<Event.EventType>, locationTypes: Set<Event.LocationType>, educationStatuses: Set<Event.EducationStatus>, paidSelected: Bool, freeSelected: Bool, includedSelected: Bool, excludedSelected: Bool, minAge: String, maxAge: String, minTeamSize: String, maxTeamSize: String) {
        filters.types = types
        filters.locationTypes = locationTypes
        filters.educationStatuses = educationStatuses
        filters.entryFee = getBoolValueOrNil(condition1: paidSelected, condition2: freeSelected)
        filters.prizePool = getBoolValueOrNil(condition1: includedSelected, condition2: excludedSelected)
        filters.minAge = !minAge.isEmpty ? Int(minAge) : nil
        filters.maxAge = !maxAge.isEmpty ? Int(maxAge) : nil
        filters.minTeamSize = !minTeamSize.isEmpty ? Int(minTeamSize) : nil
        filters.maxTeamSize = !maxTeamSize.isEmpty ? Int(maxTeamSize) : nil
    }
    
    private func getBoolValueOrNil(condition1: Bool, condition2: Bool) -> Bool? {
        if condition1 && condition2 {
            return nil
        } else if condition1 {
            return true
        } else if condition2 {
            return false
        } else {
            return nil
        }
    }
}
