//
//  StartViewData.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import Foundation

class StartViewData: ObservableObject {
    
    @Published var questionsToGenerate = 5
    @Published var counter = 0
    @Published var animateColor = false
    @Published var startButtonClicked = false
    @Published var startGame = false
    @Published var question = [String: Int]()
    
}
