//
//  StartView.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import SwiftUI
import Foundation

struct StartView: View {

    @State private var questionsToGenerate = 5
    @State private var animateColor = false
    @State private var dataToPass = [Task]()
    
    @ObservedObject var data: StartViewData
    @Binding var endGame: Bool
    
    let buttonWidth: CGFloat = 60
    let buttonHeight: CGFloat = 35
    let startButtonWidth: CGFloat = 150
    let buttonCornerRadius: CGFloat = 16
    let opacityValue = 0.7
    let spacing: CGFloat = 15
    let animationDuration = 0.3
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Multiplication")
                    .fontWeight(.black)
                    .appLogoStyle()
                
                Text("Practise")
                    .fontWeight(.black)
                    .appLogoStyle()
                
                Spacer()
                    .frame(height: 580)
                
            }
            
            VStack {
                
                Text("In what range\nwould you like to practise?")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                HStack {
                    
                    Text("Range: 1 - \(data.multiplicationRange)")
                        .padding()
                        .foregroundColor(.black)
                    
                    Stepper(value: $data.multiplicationRange, in: 1...12) {
                    }
                    .padding()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .background(Color.white.opacity(opacityValue))
                .cornerRadius(buttonCornerRadius)
                
                Text("How many questions\nwould you like to get?")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VStack {
                    
                    HStack(spacing: spacing) {
                        
                        Button(action: {
                            questionButtonTapped(5)
                        }) {
                            Text("5")
                                .font(.title)
                                .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: buttonWidth)
                        .buttonStyle()
                        .background(self.animateColor ? (data.questionsToGenerate == 5 ? Color.green.opacity(opacityValue) : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                        .cornerRadius(buttonCornerRadius)
                        
                        
                        Button(action: {
                            questionButtonTapped(10)
                        }) {
                            Text("10")
                                .font(.title)
                                .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: buttonWidth)
                        .buttonStyle()
                        .background(self.animateColor ? (data.questionsToGenerate == 10 ? Color.green.opacity(opacityValue) : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                        .cornerRadius(buttonCornerRadius)
                    }
                    
                    Spacer()
                        .frame(height: spacing)
                    
                    HStack(spacing: spacing) {
                        
                        Button(action: {
                            questionButtonTapped(20)
                        }) {
                            Text("20")
                                .font(.title)
                                .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: buttonWidth)
                        .buttonStyle()
                        .background(self.animateColor ? (data.questionsToGenerate == 20 ? Color.green.opacity(opacityValue) : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                        .cornerRadius(buttonCornerRadius)
                        
                        Button(action: {
                            questionButtonTapped(data.multiplicationRange * 12)
                        }) {
                            Text("All")
                                .font(.title)
                                .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: buttonWidth)
                        .buttonStyle()
                        .background(self.animateColor ? (data.questionsToGenerate == data.multiplicationRange * 12 ? Color.green.opacity(opacityValue) : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                        .cornerRadius(buttonCornerRadius)
                        
                    }
                    
                    Button(action: {
                        startButtonTapped()
                    }) {
                        Text("Start the game!")
                            .font(.body)
                            .frame(minWidth: startButtonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: startButtonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (data.startButtonClicked ? Color.green.opacity(opacityValue) : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    .offset(y: 50)
                    
                }
            }
        }
    }
    
    func questionButtonTapped(_ value: Int) {
        
        data.questionsToGenerate = value
        let delay = 0.3
        
        if (data.counter == 0) {
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                self.animateColor.toggle()
            }
        }
        
        if (data.counter > 0) {
            self.animateColor.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + delay / 5) {
                withAnimation(Animation.easeInOut(duration: animationDuration)) {
                    self.animateColor.toggle()
                }
            }
        }
        
        data.counter += 1
        
    }
    
    func startButtonTapped() {
        
        let delay = 0.3
        endGame = false
        data.tasks = TaskSet.generateTasks(range: data.multiplicationRange, numberOfQuestions: data.questionsToGenerate)
        data.startButtonClicked = true
        
        withAnimation(Animation.easeInOut(duration: animationDuration)) {
            self.animateColor.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            data.startGame = true
        }
    }
}

struct appLogo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.largeTitle)
    }
}

extension View {
    func appLogoStyle() -> some View {
        self.modifier(appLogo())
    }
}

struct buttonOption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding(.all)
    }
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(buttonOption())
    }
}
