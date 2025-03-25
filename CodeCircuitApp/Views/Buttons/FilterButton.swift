//
//  FilterButton.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 25/03/2025.
//

import SwiftUI

struct FilterButton: View {
    var text: String
    var action: () -> Void
    var selected: Bool
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(UIColor.systemGray5))
                .overlay(selected ?                                     RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 4) : nil)
                .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    FilterButton(text: "Conference", action: {print("hello")}, selected: true)
}
