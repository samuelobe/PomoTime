//
//  PomoViewModel.swift
//  PomoTime
//
//  Created by Sam Obe on 4/30/21.
//

import Foundation

class PomoViewModel: ObservableObject {
    @Published var timeRemaining : Int
    @Published var startCountdown = false
    let constTimeRemaining : Int
    
    init(minutes : Int) {
        self.timeRemaining = minutes * 60
        self.constTimeRemaining = minutes * 60
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func reset(){
        timeRemaining = constTimeRemaining
        startCountdown = false
    }
    
    static func testState(minutes : Int) -> PomoViewModel {
        let viewModel = PomoViewModel(minutes: minutes)
        
        return viewModel
    }
}
