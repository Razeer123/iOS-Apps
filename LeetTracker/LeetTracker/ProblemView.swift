//
//  ProblemView.swift
//  LeetTracker
//
//  Created by Michał Derej on 21/02/2021.
//

import SwiftUI

struct ProblemView: View {
    
    let problem: LeetProblem
    let doneProblems: Int
    let difficulty: String = "Hard"
    let formatter = DateFormatter()
    let numberOfProblems = 1771
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    
                    if (!problem.notes.isEmpty) {
                        HStack {
                            VStack {
                                Text(problem.notes)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    
                    HStack {
                        VStack {
                            Text("Written in:")
                        }
                        VStack {
                            Text(problem.language)
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    HStack {
                        
                        VStack {
                            Text("Difficulty:")
                        }
                        
                        VStack {
                            Text(problem.difficulty)
                                .fontWeight(.bold)
                                .foregroundColor(difficulty == "easy" ? Color.green : (difficulty == "medium" ? Color.orange : Color.red))
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        VStack {
                            Text("Solved")
                        }
                        VStack {
                            Text("\(doneProblems) / \(numberOfProblems)")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        VStack {
                            Text("problems in \(problem.language)")
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    HStack {
                        VStack {
                            Text("Added:")
                        }
                        VStack {
                            Text("\(formatter.string(from: problem.addedDate))")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    VStack {
                        Text("Track your progress")
                            .font(.headline)
                    }
                    
                    // draw chart here
                    
                }
                Spacer()
            }
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
