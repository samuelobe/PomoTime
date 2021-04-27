//
//  ContentView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timeRemaining = 25*60 // 25 minutes in seconds
    @State private var startCountdown = false;
    @State var selected = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack{
            Picker(selection: $selected, label: Text(""), content: {
                Text("Pomodoro").tag(0)
                Text("Short Break").tag(1)
                Text("Long Break").tag(2)
            }).pickerStyle(SegmentedPickerStyle()).padding()
            Spacer()
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
    
    //Convert the time into 24hr (24:00:00) format
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
