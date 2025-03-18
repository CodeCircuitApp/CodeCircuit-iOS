//
//  EventDetailCell.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 18/03/2025.
//

import SwiftUI

struct EventDetailCell: View {
    let label: String
    let text: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                HStack {
                    Text(label.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text(text)
                        .font(.subheadline)
                    Spacer()
                }
            }
            .padding(8)
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 8).fill(Color(UIColor.systemGray5)))
    }
}

#Preview {
    EventDetailCell(label: "Date", text: "27 Jun 2025")
}
