//
//  Address.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 19/03/2025.
//

import Foundation

struct Address: Equatable, Hashable, Codable {
    var street: String?
    var city: String?
    var state: String? // Also province, region, voivoideship
    var postalCode: String?
    var country: String?
    
    func joined() -> String {
        return "\(street!), \(city!), \(state!), \(country!)"
    }
}
