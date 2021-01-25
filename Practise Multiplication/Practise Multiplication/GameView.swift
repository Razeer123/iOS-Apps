//
//  GameView.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import SwiftUI

// This struct decides what should be displayed

struct GameView: View {
    
    @State private var questionNumber = 0
    @State private var gameInProgress = false
    @State private var answer = ""
    
    @Binding var tasks: [Task]
    var buttonWidth: CGFloat = 60
    var buttonHeight: CGFloat = 25
    var startButtonWidth: CGFloat = 150
    var spacing: CGFloat = 15
    var answerSpacing: CGFloat = 50
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text(tasks[questionNumber].task)
                        .foregroundColor(.white)
                        .font(.title)
                    Text(answer.isEmpty ? "?" : answer)
                        .foregroundColor(.green)
                        .font(.title)
                    
                }
                
                Spacer()
                    .frame(height: answerSpacing)
                
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        // sth
                    }){
                        Text("1")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Text("2")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Text("3")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                }
                HStack {
                    
                    Button(action: {
                        // sth
                    }){
                        Text("4")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Text("5")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Text("6")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                }
                HStack {
                    
                    Button(action: {
                        // sth
                    }){
                        Text("7")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Text("8")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Text("9")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                }
                
                HStack {
                    
                    Button(action: {
                        // sth
                    }){
                        Image(systemName: "delete.left")
                            .font(.system(size: 25))
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Text("0")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                    Button(action: {
                        // sth
                    }){
                        Image(systemName: "hand.thumbsup")
                            .font(.system(size: 25))
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(16)
                    
                }
                
                
                Spacer()
                    .frame(height: 40)
                
            }
        }
    }
}

struct numericalButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding(.all)
    }
}

extension View {
    func numericalStyle() -> some View {
        self.modifier(numericalButton())
    }
}
