//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Michał Derej on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var playersScore = 0
    @State private var alert = ""
    @State private var roundCounter = 1
    @State private var endGame = false
    @State private var finalScore = 0
    
    let moves = ["Rock", "Paper", "Scissors"]
    
    var winningNumber: Int {
        
        if (computerChoice == 0) {
            return 1
        } else if (computerChoice == 1) {
            return 2
        }
        
        return 0
        
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                
                Text("Your score is: \(playersScore)")
                    .formatText()
                    .padding()
                
                Text("In round \(roundCounter) you should")
                    .formatText()
                
                if (shouldWin) {
                    Text("win")
                        .featureText()
                        .foregroundColor(.green)
                } else {
                    Text("lose")
                        .featureText()
                        .foregroundColor(.red)
                }
                
                Text("Computer move:")
                    .formatText()
                    .padding()
                
                Image(self.moves[computerChoice])
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 150, alignment: .center)
                
                Text("Pick move:")
                    .formatText()
                    .padding()
                
                HStack {
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.usedAction(number: number)
                        }) {
                            Image(self.moves[number])
                                .button()
                        }
                    }
                }
                .frame(width: .infinity, alignment: .center)
                
                Text("\(alert)")
                    .formatText()
                    .padding()
                
                Spacer()
                    .frame(height: 75)
                
            }
        }
        
        .alert(isPresented: $endGame) {
            Alert(title: Text("This is the end..."), message: Text("Congrats! \(finalScore) / 10 got correct!"), dismissButton: .default(Text("Restart")) {
                nextRound()
            })
        }
        
    }
    
    func usedAction(number: Int) {
        
        roundCounter += 1
        
        if ((!shouldWin && winningNumber != number) || (shouldWin && winningNumber == number)) {
            playersScore += 1
            alert = "Correct!"
        } else {
            alert = "Wrong!"
        }
        
        if (roundCounter == 10) {
            finalScore = playersScore
            endGame = true
            restartGame()
        }
        
        nextRound()
        
    }
    
    func nextRound() {
        computerChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func restartGame() {
        roundCounter = 0
        playersScore = 0
    }
}

extension Text {
    func formatText() -> Text {
        self
            .foregroundColor(.white)
            .font(.title2)
            .fontWeight(.bold)
    }
}

extension Text {
    func featureText() -> Text {
        self
            .font(.title)
            .fontWeight(.black)
    }
}

extension Image {
    func button() -> some View {
        self
            .resizable()
            .renderingMode(.original)
            .shadow(color: .black, radius: 2)
            .aspectRatio(1.0, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
