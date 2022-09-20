//
//  IntegratedSlider.swift
//  Game
//
//  Created by John Doe on 19/09/2022.
//

import SwiftUI

struct IntegratedSlider: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider(frame: .zero)
       
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        view.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension IntegratedSlider {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        IntegratedSlider(value: .constant(22), alpha: 100, color: .blue)
    }
}
