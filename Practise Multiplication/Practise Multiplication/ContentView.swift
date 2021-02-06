//
//  ContentView.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import SwiftUI

// This struct decides what should be displayed

struct ContentView: View {
    
    @ObservedObject var start = StartViewData()
    @State var endGame = false
    
    var body: some View {
        if (!start.startGame || endGame) {
            StartView(data: start, endGame: $endGame)
        } else {
            GameView(endGame: $endGame, tasks: $start.tasks)
        }
    }
}

// Additional views are created below

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
