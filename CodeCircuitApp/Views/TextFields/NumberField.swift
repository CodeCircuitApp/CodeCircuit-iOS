//
//  NumberField.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 25/03/2025.
//

import SwiftUI

struct NumberField: View {
    let name: String
    @Binding var value: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.callout)
                .padding(.horizontal)
            TextField(name, text: $value)
                .padding()
                .keyboardType(.numberPad)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)
        }
    }
}

#Preview {
    @Previewable @State var value = ""
    
    NumberField(name: "Min", value: $value)
}
