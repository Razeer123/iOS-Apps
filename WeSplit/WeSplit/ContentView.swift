//
//  ContentView.swift
//  WeSplit
//
//  Created by Michał Derej on 29/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) + 2
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return (orderAmount + orderAmount / 100 * tipSelection) / peopleCount
    }
    
    var totalBill: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return (orderAmount + orderAmount / 100 * tipSelection)
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 21) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Select tip amount")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total bill")) {
                    Text("$\(totalBill, specifier: "%.2f")")
                }
                
                Section(header: Text("Cost per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("Bill Companion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
