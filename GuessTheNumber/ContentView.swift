//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by NikolayD on 18.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewVM = ContentViewViewModel()
    
    @State var isAlertShowed = false
    
    var body: some View {
        VStack {
            TextView(targetValue: contentViewVM.targetValue)
            
            SliderView(contentViewVM: contentViewVM)
                .padding(.bottom, 40)
            
            Button("Проверь меня!") {
                isAlertShowed = true
            }
                .padding(.bottom, 20)
                .alert(
                    "Your Score",
                    isPresented: $isAlertShowed,
                    actions: {}
                ) {
                    Text(contentViewVM.computeScore().formatted())
                }
            
            Button("Начать заново", action: contentViewVM.setTargetValue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct TextView: View {
    let targetValue: Int
    
    var body: some View {
        HStack {
            Text("Подвиньте слайдер, как можно ближе к:")
            Text(targetValue.formatted())
        }
    }
}

struct SliderView: View {
    @ObservedObject var contentViewVM: ContentViewViewModel
    
    var body: some View {
        HStack {
            Text("0")
            UISliderRepresentation(
                value: $contentViewVM.currentValue,
                score: contentViewVM.computeScore()
            )
            Text("100")
        }
    }
}
