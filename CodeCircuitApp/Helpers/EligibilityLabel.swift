//
//  EligibilityLabel.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 18/03/2025.
//

import Foundation

enum EligibilityLabel {
    static func getEligibleLabel(from eligibilityCriteria: [Event.EducationStatus]?) -> String {
        guard let eligibilityCriteria else {
            return "No specific education status required."
        }
        
        guard !eligibilityCriteria.isEmpty else {
            return "No specific education status required."
        }

        let formattedStatuses = eligibilityCriteria.map { status in
            switch status {
            case .nonStudent:
                return "Individuals who are not currently enrolled as students"
            case .primarySchoolStudent:
                return "Primary school students"
            case .secondarySchoolStudent:
                return "Secondary school students"
            case .higherEducationStudent:
                return "Higher education students"
            case .postGraduate:
                return "Post-graduate students"
            }
        }

        if formattedStatuses.count == 1 {
            return "\(formattedStatuses.first!) are eligible"
        } else if formattedStatuses.count == 2 {
            return "\(formattedStatuses[0]) and \(formattedStatuses[1]) are eligible"
        } else {
            let lastStatus = formattedStatuses.last!
            let remainingStatuses = formattedStatuses.dropLast().joined(separator: ", ")
            return "\(remainingStatuses) and \(lastStatus) are eligible"
        }
    }
    
    static func getIneligibleLabel(excluding eligibilityCriteria: [Event.EducationStatus]?) -> String {
        guard let eligibilityCriteria else {
            return "No specific education status required."
        }
        
        guard !eligibilityCriteria.isEmpty else {
            return "No specific education status required."
        }

        let ineligibleStatuses = Event.EducationStatus.allCases.filter { !eligibilityCriteria.contains($0) }

        if ineligibleStatuses.isEmpty {
            return "All education statuses are eligible."
        }

        let formattedStatuses = ineligibleStatuses.map { status in
            switch status {
            case .nonStudent:
                return "Individuals who are not currently enrolled as students"
            case .primarySchoolStudent:
                return "Primary school students"
            case .secondarySchoolStudent:
                return "Secondary school students"
            case .higherEducationStudent:
                return "Higher education students"
            case .postGraduate:
                return "Post-graduate students"
            }
        }

        if formattedStatuses.count == 1 {
            return "\(formattedStatuses.first!) are not eligible"
        } else if formattedStatuses.count == 2 {
            return "\(formattedStatuses[0]) and \(formattedStatuses[1]) are not eligible"
        } else {
            let lastStatus = formattedStatuses.last!
            let remainingStatuses = formattedStatuses.dropLast().joined(separator: ", ")
            return "\(remainingStatuses) and \(lastStatus) are not eligible"
        }
    }
    
    static func getEligibleLabel(minimumAge: Int, maximumAge: Int?) -> String {
        if let maxAge = maximumAge {
            return "Individuals aged \(minimumAge) to \(maxAge) are eligible."
        } else {
            return "Individuals aged \(minimumAge) and above are eligible."
        }
    }
    
    static func getIneligibleLabel(minimumAge: Int, maximumAge: Int?) -> String {
        if let maxAge = maximumAge {
            return "Individuals under \(minimumAge) or over \(maxAge) are not eligible."
        } else {
            return "Individuals under \(minimumAge) are not eligible."
        }
    }
    
    static func filterEligibleLabel(_ status: Event.EducationStatus) -> String {
        switch status {
        case .nonStudent:
            return "non-students"
        case .primarySchoolStudent:
            return "primary schools"
        case .secondarySchoolStudent:
            return "middle schools"
        case .higherEducationStudent:
            return "undergratues"
        case .postGraduate:
            return "post graduates"
        }
    }
}
