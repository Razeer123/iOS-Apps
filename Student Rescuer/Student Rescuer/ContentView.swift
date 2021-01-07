//
//  ContentView.swift
//  Student Rescuer
//
//  Created by Michał Derej on 07/01/2021.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("When do you want to wake up?")) {
                    
                    DatePicker("Enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
            
                
                Section(header: Text("Daily coffee intake")) {
                    
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if (coffeeAmount == 1) {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
            }
            .navigationTitle("Student Rescuer")
            .navigationBarItems(trailing:
                                    Button(action: calculateBedTime) {
                                        Text("Calculate")
                                    }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    // Uses ML model to predict time needed to sleep
    
    func calculateBedTime() {
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 3600
        let minute = (components.minute ?? 0) * 60
        
        // Prediction can fail so we'll be catching errors
        
        do {
            
            let model: SleepCalculator = try SleepCalculator(configuration: MLModelConfiguration())
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formater = DateFormatter()
            formater.timeStyle = .short
            alertMessage = formater.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is..."
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was an error. Try again later."
        }
        
        showingAlert = true
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
