//
//  ShortViewModel.swift
//  PomoTime
//
//  Created by Sam Obe on 5/2/21.
//

import Foundation

class ShortViewModel: ObservableObject {
    @Published var timeRemaining = 5*60 // 15 minutes in seconds
    @Published var startCountdown = false;
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    static func testState() -> ShortViewModel {
        let viewModel = ShortViewModel()
        
        return viewModel
    }
}
