//
//  LongViewModel.swift
//  PomoTime
//
//  Created by Sam Obe on 5/2/21.
//

import Foundation

class LongViewModel: ObservableObject {
    @Published var timeRemaining = 15*60 // 15 minutes in seconds
    @Published var startCountdown = false;
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    static func testState() -> LongViewModel {
        let viewModel = LongViewModel()
        
        return viewModel
    }
}
