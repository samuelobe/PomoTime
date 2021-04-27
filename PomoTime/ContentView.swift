//
//  ContentView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    // 25 minutes in seconds
    @State private var timeRemaining = 25*60
    @State private var startCountdown = false;
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(timeString(time: timeRemaining))
                .padding()
                .font(.largeTitle)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 && startCountdown != false {
                        timeRemaining -= 1
                    }
                }
            Button(action: {
                self.startCountdown = true
            }) {
                Text("Start Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            Spacer().frame(width: 0, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Button(action: {self.startCountdown = false}) {
                Text("Stop Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
    
    //Convert the time into 24hr (24:00:00) format
    func timeString(time: Int) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
