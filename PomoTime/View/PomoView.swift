//
//  PomoView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import SwiftUI


struct PomoView: View {
    @ObservedObject var viewModel : PomoViewModel
    
    var body: some View {
        VStack{
            HStack {
                Spacer().frame(width: 75)
                ZStack {
                    ProgressView(progress: Float(viewModel.timeRemaining)*(1/(25*60)), color: .red)
                    Text(timeString(time: viewModel.timeRemaining))
                        .foregroundColor(.red)
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

struct PomoView_Previews: PreviewProvider {
    static var previews: some View {
        PomoView(viewModel: PomoViewModel.testState()).previewLayout(.sizeThatFits)
    }
}


