//
//  ContentView.swift
//  LeetTracker
//
//  Created by Michał Derej on 21/02/2021.
//

import SwiftUI
import SwiftUICharts

struct LeetProblem: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let language: String
    let difficulty: String
    let notes: String
    let addedDate: Date
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

struct MainView: View {
    
    @ObservedObject var problems = LeetProblems()
    @State private var addingProblem = false
    @State private var deletingItems = false
    
    let cornerRadius: CGFloat = 25
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(problems.problems, id: \.self) { problem in
                    NavigationLink(destination: ProblemView(problem: problem, doneProblems: checkYeetedProblems(language: problem.language))) {
                        
                        Image("\(problem.language)")
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
                .onDelete(perform: removeProblems)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("LeetTracker")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.addingProblem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
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
    
    func checkAverageDiffuculty(language: String) -> Double {
        
        var problemsDifficulty = [0.0, 0.0, 0.0]
        var count = 0.0
        var average = 0.0
        
        for problem in self.problems.problems {
            if (problem.language == language) {
                if (problem.difficulty == "Easy") {
                    problemsDifficulty[0] += 1
                } else if (problem.difficulty == "Medium") {
                    problemsDifficulty[1] += 2
                } else {
                    problemsDifficulty[2] += 3
                }
                count += 1
            }
        }
        
        for i in 0...2 {
            average += problemsDifficulty[i]
        }
        
        return average / count
        
    }
    
    func removeProblems(at offset: IndexSet) {
        problems.problems.remove(atOffsets: offset)
    }
}

struct StatsView: View {
    
    @State private var language = "Swift"
    
    let numberOfProblems = 1771.0
    static let languages = ["C", "C++", "C#", "Java", "JavaScript", "Python", "Swift"]
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical) {
                
                Text("Choose language")
                    .bold()
                
                Picker("Language", selection: $language) {
                    ForEach(Self.languages, id: \.self) {
                        Text($0)
                    }
                }
                
                Text("\(language) stats")
                    .bold()
                
                PieChartView(data: [Double(MainView().checkYeetedProblems(language: language)), numberOfProblems], title: language)
                
                HStack {
                    VStack {
                        Text("You solved")
                    }
                    VStack {
                        Text("\(MainView().checkYeetedProblems(language: language)) / \(Int(numberOfProblems))")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    VStack {
                        Text("problems in \(language)")
                    }
                    
                    Spacer()
                    
                }
                .padding(10)
                
                
                HStack {
                    VStack {
                        Text("Average difficulty in \(language) was:")
                    }
                    VStack {
                        if (MainView().checkAverageDiffuculty(language: language) == 1.0) {
                            Text("easy")
                                .bold()
                                .foregroundColor(.green)
                        } else if (MainView().checkAverageDiffuculty(language: language) <= 2.0) {
                            Text("medium")
                                .bold()
                                .foregroundColor(.orange)
                        } else {
                            Text("medium")
                                .bold()
                                .foregroundColor(.red)
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(10)
                
                Spacer()
                
            }
            .navigationTitle("Stats")
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            MainView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Add Problems")
                }
            
            StatsView()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Problem Stats")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
