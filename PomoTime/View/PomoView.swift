//
//  PomoView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import SwiftUI


struct PomoView: View {
    @ObservedObject var viewModel : TimerViewModel
    @EnvironmentObject var contentViewModel : ContentViewModel
    var color : Color
    
    var body: some View {
        VStack{
            HStack {
                Spacer().frame(width: 75)
                ZStack {
                    ProgressView(progress: viewModel.getProgress(), color: color)
                    Text(timeString(time: viewModel.timeRemaining))
                        .foregroundColor(color)
                        .padding()
                        .font(.largeTitle)
                        .onReceive(viewModel.timer) { _ in
                            if viewModel.timeRemaining > 0 && viewModel.startCountdown == true {
                                viewModel.timeRemaining -= 1
                            }
                            else if viewModel.timeRemaining <= 0 && viewModel.startCountdown == true   {
                                contentViewModel.numPomoCycles+=1
                                
                                if contentViewModel.numPomoCycles % 4 == 0 {
                                    contentViewModel.selected = 2
                                }
                                else{
                                    contentViewModel.selected = 1
                                }
                                
                                viewModel.reset()
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
        PomoView(viewModel: TimerViewModel.testState(minutes: 25), color: .red).previewLayout(.sizeThatFits)
    }
}


