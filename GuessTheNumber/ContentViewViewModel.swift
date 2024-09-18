//
//  ContentViewViewModel.swift
//  GuessTheNumber
//
//  Created by NikolayD on 18.09.2024.
//

import Foundation
import Combine

final class ContentViewViewModel: ObservableObject {
    @Published var targetValue: Int
    @Published var currentValue: Double
    
    init() {
        targetValue = Int.random(in: 0...100)
        currentValue = Double.random(in: 0...100)
    }
    
    func setTargetValue() {
        targetValue = Int.random(in: 0...100)
    }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}
