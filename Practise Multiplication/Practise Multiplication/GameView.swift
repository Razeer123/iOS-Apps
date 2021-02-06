//
//  GameView.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import SwiftUI

// This struct decides what should be displayed

struct GameView: View {
    
    @ObservedObject var start = StartViewData()
    
    @State var questionNumber = 0
    @State var gameInProgress = false
    @State var answer = ""
    @State var score = 0
    @State var showAlert = false
    @State var animateColor = false
    @State var pickedOption = -1
    @State var animateIncrease = false
    @State var animateDecrease = false
    @State var showText = false
    
    @Binding var endGame: Bool
    @Binding var tasks: [Task]
    
    let buttonWidth: CGFloat = 60
    let buttonHeight: CGFloat = 25
    let startButtonWidth: CGFloat = 150
    let spacing: CGFloat = 15
    let answerSpacing: CGFloat = 50
    let buttonCornerRadius: CGFloat = 16
    let iconSize: CGFloat = 25
    let opacityValue = 0.7
    let animationDuration = 0.3
    let scoreUpdateDuration = 1.0
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.white)
            
            VStack {
                ZStack {
                    
                    Spacer()
                        .frame(height: answerSpacing)
                    
                    Text("Score: \(score)")
                        .foregroundColor(animateIncrease ? .green : (animateDecrease ? .red : .white))
                        .font(.title2)
                    
                    Text("+1")
                        .font(.title2)
                        .foregroundColor(animateIncrease ? .green : .clear)
                        .opacity(animateIncrease ? 0 : 1)
                        .offset(x: 35, y: animateIncrease ? -40 : -20)
                    
                    Text("-1")
                        .font(.title2)
                        .foregroundColor(animateDecrease ? .red : .clear)
                        .opacity(animateDecrease ? 0 : 1)
                        .offset(x: 35, y: animateDecrease ? 50 : 20)
                    
                }
                
                Spacer()
            }
            
            VStack {
                
                Text("Wrong! Try again!")
                    .foregroundColor(showText ? .red : .clear)
                    .font(.title)
                
                Spacer()
                    .frame(height: answerSpacing)
                
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
                        clickNumericalKey(number: 1)
                    }){
                        Text("1")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 1 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        clickNumericalKey(number: 2)
                    }){
                        Text("2")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 2 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        clickNumericalKey(number: 3)
                    }){
                        Text("3")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 3 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                }
                HStack {
                    
                    Button(action: {
                        clickNumericalKey(number: 4)
                    }){
                        Text("4")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 4 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        clickNumericalKey(number: 5)
                    }){
                        Text("5")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 5 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        clickNumericalKey(number: 6)
                    }){
                        Text("6")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 6 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                }
                HStack {
                    
                    Button(action: {
                        clickNumericalKey(number: 7)
                    }){
                        Text("7")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 7 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        clickNumericalKey(number: 8)
                    }){
                        Text("8")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 8 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        clickNumericalKey(number: 9)
                    }){
                        Text("9")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 9 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                }
                
                HStack {
                    
                    Button(action: {
                        clickDeleteKey()
                    }){
                        Image(systemName: "delete.left")
                            .font(.system(size: iconSize))
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == -1 ? Color.red.opacity(opacityValue) : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        clickNumericalKey(number: 0)
                    }){
                        Text("0")
                            .font(.title2)
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 0 ? Color.white : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                    Button(action: {
                        if (checkAnswer()) {
                            questionNumber += 1
                            answer.removeAll()
                        }
                    }){
                        Image(systemName: "hand.thumbsup")
                            .font(.system(size: iconSize))
                            .frame(minWidth: buttonWidth, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: buttonHeight, maxHeight: buttonHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: buttonWidth)
                    .buttonStyle()
                    .background(self.animateColor ? (pickedOption == 2137 ? Color.green.opacity(opacityValue) : Color.white.opacity(opacityValue)) : Color.white.opacity(opacityValue))
                    .cornerRadius(buttonCornerRadius)
                    
                }
                
                Spacer()
                    .frame(height: 40)
                
            }
        }
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Congratulations!"), message: Text("You're score was \(score)"), dismissButton: .default(Text("OK")) {
                endGame = true
            })
        }
    }
    
    func clickNumericalKey(number: Int) {
        
        pickedOption = number
        
        if (answer.count > 5) {
            return
        }
        
        animate()
        answer.append(String(number))
    }
    
    func clickDeleteKey() {
        
        pickedOption = -1
        animate()
        
        if (!answer.isEmpty) {
            answer.removeLast()
        }
        return
    }
    
    func checkAnswer() -> Bool {
        
        pickedOption = 2137
        animate()
        
        if (answer == tasks[questionNumber].answer) {
            score += 1
            
            withAnimation(Animation.easeInOut(duration: scoreUpdateDuration)) {
                animateIncrease.toggle()
            }
            
            checkEndGame()
            return true
        }
        if (score > 0) {
            score -= 1
            
            withAnimation(Animation.easeInOut(duration: scoreUpdateDuration)) {
                animateDecrease.toggle()
            }
            
        }
        withAnimation(Animation.easeInOut(duration: scoreUpdateDuration)) {
            showText.toggle()
        }
        checkEndGame()
        return false
    }
    
    func checkEndGame() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + scoreUpdateDuration) {
            restoreDefault()
        }
        
        if (questionNumber == tasks.count - 1) {
            start.questionsToGenerate = 0
            start.multiplicationRange = 0
            start.animateColor = false
            start.startButtonClicked = false
            start.startGame = false
            questionNumber = 0
            showAlert.toggle()
        }
    }
    
    func animate() {
        withAnimation(Animation.easeInOut(duration: animationDuration)) {
            self.animateColor.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                self.animateColor.toggle()
            }
        }
    }
    
    func restoreDefault() {
        animateDecrease = false
        animateIncrease = false
        showText = false
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
