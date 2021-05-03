//
//  LongView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import SwiftUI

struct LongView: View {
    @ObservedObject var viewModel : TimerViewModel
    
    var body: some View {
        VStack{
            HStack {
                Spacer().frame(width: 75)
                ZStack {
                    ProgressView(progress: Float(viewModel.timeRemaining)*(1/(15*60)), color: .green)
                    Text(timeString(time: viewModel.timeRemaining))
                        .foregroundColor(.green)
                        .padding()
                        .font(.largeTitle)
                        .onReceive(viewModel.timer) { _ in
                            if viewModel.timeRemaining > 0 && viewModel.startCountdown != false {
                                viewModel.timeRemaining -= 1
                            }
                        }
                }
                Spacer().frame(width: 75)
            }
            Button(action: {
                viewModel.startCountdown.toggle()
            }) {
                if viewModel.startCountdown {
                    Text("Stop Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                else{
                    Text("Start Countdown").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct LongView_Previews: PreviewProvider {
    static var previews: some View {
        LongView(viewModel: TimerViewModel.testState(minutes: 15)).previewLayout(.sizeThatFits)
    }
}
