//
//  ProblemView.swift
//  LeetTracker
//
//  Created by Michał Derej on 21/02/2021.
//

import SwiftUI
import Charts

struct ProblemView: View {
    
    let problem: LeetProblem
    let doneProblems: Int
    let formatter = DateFormatter()
    let numberOfProblems = 1771
    let secondsInDay: Double = 60 * 60 * 24
    
    // Things that are here will change - right now I'm just writing interfaces and app logic
    
    var body: some View {
        Form {
            if (!problem.notes.isEmpty) {
                Section(header: Text("Problem notes")) {
                    Text(problem.notes)
                }
            }
            
            Section(header: Text("Language")) {
                Text(problem.language)
            }
            
            Section(header: Text("Difficulty")) {
                Text(problem.difficulty)
                    .foregroundColor(problem.difficulty == "Easy" ? .green : (problem.difficulty == "Medium" ? .orange : .red))
            }
            
            Section() {
                
                let formatter = initializeFormatter()
                let secondsInTwoDays = secondsInDay * 2
                let secondsInThreeDays = secondsInDay * 3
                let secondsInFourDays = secondsInDay * 4
                
                VStack {
                    HStack {
                        
                        Spacer()
                            .frame(width: 55)
                        
                        Chart(data: [0.1, 0.2, 0.3, 0.4, 0.5].reversed())
                            .chartStyle(
                                ColumnChartStyle(column: Capsule().foregroundColor(.green).frame(width: 10), spacing: 2)
                            )
                        
                        Spacer()
                            .frame(width: 55)
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        Text(formatter.string(from: Date().addingTimeInterval(-secondsInFourDays)))
                            .font(.system(size: 10))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Spacer()
                            .frame(width: 10)
                        
                        Text(formatter.string(from: Date().addingTimeInterval(-secondsInThreeDays)))
                            .font(.system(size: 10))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Spacer()
                            .frame(width: 10)
                        
                        Text(formatter.string(from: Date().addingTimeInterval(-secondsInTwoDays)))
                            .font(.system(size: 10))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Spacer()
                            .frame(width: 10)
                        
                        Text(formatter.string(from: Date().addingTimeInterval(-secondsInDay)))
                            .font(.system(size: 10))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Spacer()
                            .frame(width: 10)
                        
                        Text(formatter.string(from: Date()))
                            .font(.system(size: 10))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Text("Your daily progress")
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                }
            }
            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            .navigationBarTitle(problem.name)
        }
    }
    
    func initializeFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        return formatter
    }
    
}

struct ProblemView_Previews: PreviewProvider {
    
    static let leetProblems = LeetProblems()
    
    static var previews: some View {
        ProblemView(problem: leetProblems.problems[0], doneProblems: 0)
    }
}
