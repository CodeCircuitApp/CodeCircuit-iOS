//
//  Filters.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 30/03/2025.
//

import Foundation

struct Filters {
    var types: Set<Event.EventType> = []
    var locationTypes: Set<Event.LocationType> = []
    var educationStatuses: Set<Event.EducationStatus> = []
    var entryFee: Bool? = nil
    var prizePool: Bool? = nil
    var minAge: Int? = nil
    var maxAge: Int? = nil
    var minTeamSize: Int? = nil
    var maxTeamSize: Int? = nil
}
