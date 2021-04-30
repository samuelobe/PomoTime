//
//  PomoView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import SwiftUI


struct PomoView: View {
    @ObservedObject var pomoViewModel = PomoViewModel()
    
    var body: some View {
        VStack{
            HStack {
                Spacer().frame(width: 75)
                ZStack {
                    ProgressView(progress: Float(pomoViewModel.timeRemaining)*(1/(25*60)))
                    Text(timeString(time: pomoViewModel.timeRemaining))
                        .foregroundColor(.red)
                        .padding()
                        .font(.largeTitle)
                        .onReceive(pomoViewModel.timer) { _ in
                            if pomoViewModel.timeRemaining > 0 && pomoViewModel.startCountdown != false {
                                pomoViewModel.timeRemaining -= 1
                            }
                        }
                }
                Spacer().frame(width: 75)
            }
            Button(action: {
                pomoViewModel.startCountdown.toggle()
            }) {
                if pomoViewModel.startCountdown {
                    Text("Stop Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                else{
                    Text("Start Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct PomoView_Previews: PreviewProvider {
    static var previews: some View {
        PomoView()
    }
}


