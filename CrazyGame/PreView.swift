//
//  PreView.swift
//  Game
//
//  Created by John Doe on 19/09/2022.
//

import SwiftUI

struct PreSlider: View {
    
    @Binding var currentValue: Double
    
    let targetValue: Int
   
     
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер поближе к: \(targetValue)")
                .bold()
            
            HStack {
                
                Text("0")
                IntegratedSlider(value: $currentValue, alpha: alpha, color: color)
                Text("100")
                
            } .padding()
        }
        
        
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        
        PreSlider(
            
            currentValue: .constant(22),
            targetValue: 100,
            color: .green,
            alpha: 100
        )
        
    }
    
    
}


