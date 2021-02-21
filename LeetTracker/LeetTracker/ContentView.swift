//
//  ContentView.swift
//  LeetTracker
//
//  Created by Michał Derej on 21/02/2021.
//

import SwiftUI

struct LeetProblem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let language: String
    let difficulty: String
    let notes: String
    //let addedDate: Date
}

class LeetProblems: ObservableObject {
    @Published var problems = [LeetProblem]() {
        // Encodes data and saves it for later usage
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(problems) {
                UserDefaults.standard.set(encoded, forKey: "Problems")
            }
        }
    }
    
    // Attempts to read everything that was stored
    init() {
        if let problems = UserDefaults.standard.data(forKey: "Problems") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([LeetProblem].self, from: problems) {
                self.problems = decoded
                return
            }
        }
        self.problems = []
    }
}

struct ContentView: View {
    
    @ObservedObject var problems = LeetProblems()
    @State private var addingProblem = false
    @State private var deletingItems = false
    
    let cornerRadius: CGFloat = 25
    
    var body: some View {
        NavigationView {
            List(problems.problems) { problem in
                
                NavigationLink(destination: ProblemView(problem: problem, doneProblems: checkYeetedProblems(language: problem.language))) {
                    
                    Image("VisualStudioCode")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(problem.name)
                            .font(.headline)
                        Text(problem.language)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
            .navigationTitle("LeetTracker")
            .navigationBarItems(leading: EditButton(), trailing:
                                    Button(action: {
                                        self.addingProblem = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
            .sheet(isPresented: $addingProblem) {
                AddProblemView(problems: self.problems)
            }
        }
    }
    
    func checkYeetedProblems(language: String) -> Int {
        
        var counter = 0
        
        for problem in self.problems.problems {
            if (problem.language == language) {
                counter += 1
            }
        }
        
        return counter
    }
    
    func removeProblems(at offset: IndexSet) {
        problems.problems.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
