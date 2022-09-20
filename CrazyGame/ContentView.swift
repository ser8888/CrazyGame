//
//  ContentView.swift
//  Game
//
//  Created by John Doe on 19/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 22.2
    
    @State private var showAlert = false
    var body: some View {
       
        VStack {
           PreSlider(
            
            currentValue: $currentValue,
            targetValue: targetValue,
            color: .systemBlue,
            alpha: calculationOfTheScore()
            
           )
            
            ButtonView(
                showAlert: $showAlert,
                title: "Проверить результат",
                currentScore: calculationOfTheScore(),
                action: { showAlert = true }
            )
            
            ButtonView(title: "Начать сначала") {
                targetValue = Int.random(in: 1...100)
            }
            
         }
    }
    
    private func calculationOfTheScore() -> Int {
        
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ButtonView: View {
    @Binding var showAlert: Bool
    
    let currentScore: Int
    let title: String
    
    let action: () -> Void
    
    var body: some View {
        
        Button(title, action: action)
        
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Результат")
                    .bold()
                    .font(.title)
                ,
                message: Text(
                    "\(currentScore)"
                )
                    .bold()
                    .font(.title)
            )
            
        }
        .padding()
    }
    
    init(showAlert: Binding<Bool> = .constant(false), title: String, currentScore: Int = 0, action: @escaping () -> Void) {
        
        self._showAlert = showAlert
        
        self.title = title
        
        self.currentScore = currentScore
        
        self.action = action
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
