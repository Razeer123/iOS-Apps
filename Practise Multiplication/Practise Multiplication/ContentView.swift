//
//  ContentView.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import SwiftUI

class ChangeScreen: ObservableObject {
    @Published var isStartViewDisplayed  = true
}

// This struct decides what should be displayed

struct ContentView: View {
    
    @ObservedObject var start = StartViewData()
    
    var body: some View {
        NavigationView {
            Group {
                if (!start.startGame) {
                    StartView(data: start)
                } else {
                    GameView()
                }
            }
        }
    }
}

// Additional views are created below

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
