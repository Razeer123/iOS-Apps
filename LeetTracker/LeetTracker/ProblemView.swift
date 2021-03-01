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
            
            Section(header: Text("Problems done")) {
                HStack {
                    Text("Solved")
                    Text("\(doneProblems) / \(numberOfProblems)")
                        .foregroundColor(.blue)
                    Text("problems in \(problem.language)")
                }
            }
            
            Section() {
                
                VStack {
                    Chart(data: [0.1, 0.3, 0.2, 0.5, 0.4, 0.9, 0.1, 0.1, 0.3, 0.2, 0.5, 0.4, 0.9, 0.1, 0.1, 0.3, 0.2, 0.5, 0.4, 0.9, 0.1, 0.1, 0.3, 0.2, 0.5, 0.4, 0.9, 0.1, 0.1, 0.3, 0.2, 0.5, 0.4, 0.9, 0.1])
                        .chartStyle(
                            ColumnChartStyle(column: Capsule().foregroundColor(.green), spacing: 2)
                        )
                    
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
}

struct ProblemView_Previews: PreviewProvider {
    
    static let leetProblems = LeetProblems()
    
    static var previews: some View {
        ProblemView(problem: leetProblems.problems[0], doneProblems: 0)
    }
}
