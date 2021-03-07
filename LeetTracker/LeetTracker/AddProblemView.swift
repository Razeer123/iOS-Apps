//
//  AddProblemView.swift
//  LeetTracker
//
//  Created by Michał Derej on 21/02/2021.
//

import SwiftUI

struct AddProblemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var problems: LeetProblems
    
    @State private var name = ""
    @State private var language = "Swift"
    @State private var difficulty = "Easy"
    @State private var notes = ""
    
    static let languages = ["C", "C++", "C#", "Java", "JavaScript", "Python", "Swift"]
    static let difficultyLevel = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        NavigationView {
            Form {
                
                TextField("Name", text: $name)
                
                Picker("Language", selection: $language) {
                    ForEach(Self.languages, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Difficulty", selection: $difficulty) {
                    ForEach(Self.difficultyLevel, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Description (optional)", text: $notes)
                
            }
            .navigationBarTitle("Add new problem")
            .navigationBarItems(trailing:
                                    Button("Save") {
                                        let problem = LeetProblem(name: self.name, language: self.language, difficulty: self.difficulty, notes: self.notes, addedDate: Date())
                                        self.problems.problems.append(problem)
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
            )
        }
    }
}

struct AddProblemView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddProblemView(problems: LeetProblems())
    }
}
