//
//  EventViewViewModel.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 10/06/2025.
//

import SwiftUI
import EventKitUI

@Observable class EventViewViewModel: NSObject, EKEventEditViewDelegate {
    func saveToCalendar(event: Event) {
        let store = EKEventStore()
        
        let calendarEvent = EKEvent(eventStore: store)
        calendarEvent.title = event.name
        calendarEvent.isAllDay = true
        calendarEvent.startDate = event.date
        calendarEvent.endDate = event.date
        calendarEvent.url = event.website
        calendarEvent.location = event.address?.joined()
        calendarEvent.notes = event.description
        
        let eventEditViewController = EKEventEditViewController()
        eventEditViewController.event = calendarEvent
        eventEditViewController.eventStore = store
        eventEditViewController.editViewDelegate = self
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            var currentVC = rootViewController
            while let presentedVC = currentVC.presentedViewController {
                currentVC = presentedVC
            }
            currentVC.present(eventEditViewController, animated: true, completion: nil)
        }
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        // Dismiss the event editor
        controller.dismiss(animated: true) {
            switch action {
            case .canceled:
                print("Event creation canceled.")
            case .saved:
                print("Event saved successfully.")
            case .deleted:
                print("Event deleted.")
            @unknown default:
                fatalError("Unknown EKEventEditViewAction")
            }
        }
    }
}
