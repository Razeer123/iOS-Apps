//
//  GameView.swift
//  Practise Multiplication
//
//  Created by Michał Derej on 22/01/2021.
//

import SwiftUI

// This struct decides what should be displayed

struct GameView: View {
    
    var buttonWidth: CGFloat = 60
    var buttonHeight: CGFloat = 35
    var startButtonWidth: CGFloat = 150
    var spacing: CGFloat = 15
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct numericalButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding(.all)
            .background(Color.white.opacity(0.7))
            .cornerRadius(16)
    }
}

extension View {
    func numericalStyle() -> some View {
        self.modifier(numericalButton())
    }
}
