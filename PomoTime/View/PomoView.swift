//
//  PomoView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import SwiftUI


struct PomoView: View {
    @State private var timeRemaining = 25*60 // 25 minutes in seconds
    @State private var startCountdown = false;

    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text(timeString(time: timeRemaining))
                .padding()
                .font(.largeTitle)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 && startCountdown != false {
                        timeRemaining -= 1
                    }
                }
            Button(action: {
                self.startCountdown.toggle()
            }) {
                if self.startCountdown {
                    Text("Stop Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                else{
                    Text("Start Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}


