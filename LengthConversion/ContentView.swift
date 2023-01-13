//
//  ContentView.swift
//  LengthConversion
//
//  Created by Matheus Viana on 12/01/23.
//

import SwiftUI


func defineUnit(_ unitName: String) -> UnitLength {
    var unit: UnitLength {
        switch unitName {
        case "km":
            return .kilometers
        case "ft":
            return .feet
        case "yd":
            return .yards
        case "mi":
            return .miles
        default:
            return .meters
        }
        
    }
    return unit
}

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var selectedInputUnit: String = "m"
    @State private var selectedOutputUnit: String = "ft"
    
    let units: [String] = ["m","ft", "yd", "km", "mi"]
    
    var output: Double {
        let outputUnit = defineUnit(selectedOutputUnit)
        let input = defineUnit(selectedInputUnit)
        let outputValue = Measurement(value: inputValue, unit: input)
        
        return round(outputValue.converted(to: outputUnit).value * 100) / 100
    }
    
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
                    Text("Select the output unit")
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
