//
//  ContentView.swift
//  LengthConversion
//
//  Created by Matheus Viana on 12/01/23.
//

import SwiftUI

enum Units {
    case Km, Ft, Yd, Mi
}

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var selectedInputUnit: String = "Km"
    @State private var selectedOutputUnit: String = "Ft"
    
    let units: [String] = ["Km", "Ft", "Yd", "Mi"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $selectedInputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Value and Select Unit")
                }
            }
            .navigationTitle("Length Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
