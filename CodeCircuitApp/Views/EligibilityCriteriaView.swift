//
//  EligibilityCriteriaView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 18/03/2025.
//

import SwiftUI

struct EligibilityCriteriaView: View {
    let criteriaLabel: String
    let eligibleLabel: String
    let ineligibleLabel: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(criteriaLabel)
                    .font(.headline)
                Spacer()
            }
            HStack(spacing: 12) {
                Image(systemName: "person.fill.checkmark")
                    .foregroundStyle(.green)
                Text(eligibleLabel)
                Spacer()
            }
            HStack(spacing: 12) {
                Image(systemName: "person.fill.xmark")
                    .foregroundStyle(.red)
                Text(ineligibleLabel)
                Spacer()
            }
        }
    }
}

#Preview {
    EligibilityCriteriaView(criteriaLabel: "Education Status", eligibleLabel: "Primary school, middle school, higher institutions students are eligible", ineligibleLabel: "Individuals not currently enrolled as students are not eligible.")
        .padding()
}
