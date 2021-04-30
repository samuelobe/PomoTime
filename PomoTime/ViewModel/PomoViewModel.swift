//
//  PomoViewModel.swift
//  PomoTime
//
//  Created by Sam Obe on 4/30/21.
//

import Foundation

class PomoViewModel: ObservableObject {
    @Published var timeRemaining = 25*60 // 25 minutes in seconds
    @Published var startCountdown = false;
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
}
