//
//  PomoViewModel.swift
//  PomoTime
//
//  Created by Sam Obe on 4/30/21.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var timeRemaining : Float
    @Published var startCountdown = false
    let constTimeRemaining : Float
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(minutes : Float) {
        self.timeRemaining = minutes * 60
        self.constTimeRemaining = minutes * 60
    }
    
    func reset(){
        timeRemaining = constTimeRemaining
        startCountdown = false
    }
    
    func getProgress() -> Float{
        let progress = timeRemaining*(1/(constTimeRemaining))
        return progress
    }
    
    static func testState(minutes : Float) -> TimerViewModel {
        let viewModel = TimerViewModel(minutes: minutes)
        
        return viewModel
    }
}
