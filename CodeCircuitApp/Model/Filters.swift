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
    
    func asURLQueryItems() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        func addSetQueryItems<T: Hashable>(name: String, set: Set<T>) where T: RawRepresentable, T.RawValue == String {
            let joinedValues = set.map { $0.rawValue }.joined(separator: ",")
            
            queryItems.append(URLQueryItem(name: name, value: joinedValues))
        }
        
        if !types.isEmpty {
            addSetQueryItems(name: "type", set: types)
        }
        
        if !locationTypes.isEmpty {
            addSetQueryItems(name: "locationType", set: locationTypes)
        }
        
        if !educationStatuses.isEmpty {
            addSetQueryItems(name: "educationStatus", set: educationStatuses)
        }
        
        if let entryFee = entryFee {
            queryItems.append(URLQueryItem(name: "entryFee", value: String(entryFee)))
        }
        
        if let prizePool = prizePool {
            queryItems.append(URLQueryItem(name: "prizePool", value: String(prizePool)))
        }
        
        if let minAge = minAge {
            queryItems.append(URLQueryItem(name: "minAge", value: String(minAge)))
        }

        if let maxAge = maxAge {
            queryItems.append(URLQueryItem(name: "maxAge", value: String(maxAge)))
        }

        if let minTeamSize = minTeamSize {
            queryItems.append(URLQueryItem(name: "minTeamSize", value: String(minTeamSize)))
        }

        if let maxTeamSize = maxTeamSize {
            queryItems.append(URLQueryItem(name: "maxTeamSize", value: String(maxTeamSize)))
        }
        
        return queryItems
    }
}
