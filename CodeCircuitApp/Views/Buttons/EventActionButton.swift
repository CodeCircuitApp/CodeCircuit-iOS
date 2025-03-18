//
//  EventActionButton.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 18/03/2025.
//

import SwiftUI

struct EventActionButton: View {
    let systemName: String
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 4) {
                Image(systemName: systemName)
                    .font(.title2)
                Text(text)
            }
            .frame(minWidth: 60)
            .padding(4)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    EventActionButton(systemName: "safari.fill", text: "Website", action: { print("tapped") })
}
