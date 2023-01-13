//
//  ContentView.swift
//  LengthConversion
//
//  Created by Matheus Viana on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var selectedInputUnit: String = "Km"
    @State private var selectedOutputUnit: String = "Ft"
    
    let units: [String] = ["Km", "Ft", "Yd", "Mi"]
    
    var output: Double = 0
    
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
                
                Section {
                    Text(output, format: .number)
                    Picker("Unit", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select a unit to input be converted")
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
