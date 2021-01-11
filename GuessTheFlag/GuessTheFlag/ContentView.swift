//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Michał Derej on 02/01/2021.
//  Animation ideas come from clarknt
//

import SwiftUI

struct FlagImage: View {
    
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ShakeEffect: GeometryEffect {
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: -30 * sin(position * 2 * .pi), y: 0))
    }
    
    init(shakes: Int) {
        position = CGFloat(shakes)
    }
    
    var position: CGFloat
    var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var userScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var correct = false
    
    @State private var spinAmount = [0.0, 0.0, 0.0]
    @State private var animationNumber = 0
    @State private var shakesAmount = [0, 0, 0]
    @State private var animateOpacity = false
    @State private var animateIncrease = false
    @State private var animateDecrease = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 35) {
                Spacer()
                    .frame(height: 10)
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                // Creates three places for flags and save the number of order
                
                ForEach(0 ..< 3) { number in
                    FlagImage(name: self.countries[number])
                        .rotation3DEffect(.degrees(spinAmount[number]), axis: (x: 0, y: 1, z: 0))
                        .modifier(ShakeEffect(shakes: self.shakesAmount[number] * 2))
                        .opacity(self.animateOpacity ? (number == self.correctAnswer ? 1 : 0.25) : 1)
                        .onTapGesture {
                            self.flagTapped(number)
                        }
                }
                
                HStack {
                    
                    Spacer()
                    
                    Text("Score: ")
                        .foregroundColor(.white)
                    
                    ZStack {
                        
                        Text("\(userScore)")
                            .foregroundColor(animateIncrease ? .green : (animateDecrease ? .red : .white))
                            .font(.title)
                        
                        Text("+1")
                            .font(.headline)
                            .foregroundColor(animateIncrease ? .green : .clear)
                            .opacity(animateIncrease ? 0 : 1)
                            .offset(x: 0, y: animateIncrease ? -50 : -20)
                        
                        Text("-1")
                            .font(.headline)
                            .foregroundColor(animateDecrease ? .red : .clear)
                            .opacity(animateDecrease ? 0 : 1)
                            .offset(x: 0, y: animateDecrease ? 50 : 20)
                    }
                    
                    Spacer()
                }
                .offset(x: 0, y: 30)
                
                VStack {
                    Spacer()
                        .frame(height: 40)
                    Text("\(scoreTitle)")
                        .font(.headline)
                        .foregroundColor(showingScore ? (correct ? .green : .red) : .clear)
                }
                
                Spacer()
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        
        let questionDelay = 1.0
        let animationDuration = 0.5
        let scoreUpdateDuration = 1.5
        
        // withAnimation -> used for explicit animations
        
        withAnimation(Animation.easeInOut(duration: animationDuration)) {
            self.animateOpacity.toggle()
        }
        
        if (number == correctAnswer) {
            scoreTitle = "Correct!"
            userScore += 1
            correct.toggle()
            
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                animationNumber = number
                spinAmount[number] += 360
            }
            withAnimation(Animation.easeInOut(duration: scoreUpdateDuration)) {
                animateIncrease.toggle()
            }
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])."
            userScore -= 1
            
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                self.shakesAmount[number] = 2
            }
            withAnimation(Animation.easeInOut(duration: scoreUpdateDuration)) {
                animateDecrease.toggle()
            }
        }
        
        showingScore = true
        
        // We're using Dispatch framework's function asyncAfter to run some code after x seconds
        
        DispatchQueue.main.asyncAfter(deadline: .now() + questionDelay) {
            self.askQuestion()
        }
    }
    
    // Ensures the gameplay will continue
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        self.spinAmount[animationNumber] = 0.0
        self.shakesAmount = [0, 0, 0]
        self.animateOpacity = false
        self.animateDecrease = false
        self.animateIncrease = false
        self.showingScore = false
        self.correct = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
