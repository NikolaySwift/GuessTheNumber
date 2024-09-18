//
//  UISliderRepresentation.swift
//  GuessTheNumber
//
//  Created by NikolayD on 18.09.2024.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Double
    
    let score: Int

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(value), animated: true)
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(Float(score) / 100.0))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

#Preview {
    UISliderRepresentation(value: .constant(15), score: 20)
}
