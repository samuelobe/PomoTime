//
//  TimerView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import SwiftUI


struct TimerView: View, KeyboardReadable {
    @ObservedObject var viewModel : TimerViewModel
    @EnvironmentObject var contentViewModel : ContentViewModel
    @State private var inEditMode = false
    @State private var isGray = true
    @State private var placeholderText = "What is your current task?"
    @State private var text = ""
    var color : Color
    
    var body: some View {
        VStack{
            Spacer().frame(height: 75)
            HStack{
                if inEditMode {
                    TextField("Task", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 5)
                        .font(.system(size: 25))
                        .onReceive(keyboardPublisher) { newIsKeyboardVisible in
                            print("Is keyboard visible? ", newIsKeyboardVisible)
                            inEditMode = newIsKeyboardVisible
                        }
                }
                else {
                    
                    Text(text.count == 0 ? placeholderText : text)
                        .font(.system(size: 25))
                        .foregroundColor(text.count == 0 ? .gray : .black)
                    
                }
                
                Button(action: {
                    self.inEditMode.toggle()
                }) {
                    Image(systemName: "pencil" )
                        .font(.system(size: 25))
                        .foregroundColor(text.count == 0 ? .gray : .black)
                }
            }
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
                                
                                if contentViewModel.numPomoCycles % 2 == 0 {
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
            Spacer().frame(height: 75)
            Button(action: {
                viewModel.startCountdown.toggle()
            })
            {
                if viewModel.startCountdown {
                    TimerButton(systemName: "pause.fill", color: color)
                }
                else{
                    TimerButton(systemName: "play.fill", color: color)
                }
            }
        }.ignoresSafeArea(.keyboard)
    }
}

struct TimerButton: View {
    var systemName : String
    var color: Color
    
    var body: some View{
        Image(systemName: systemName).frame(width: 80, height: 80)
            .foregroundColor(Color.white)
            .background(color)
            .clipShape(Circle())
            .font(.system(size: 25))
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewModel: TimerViewModel.testState(minutes: 25), color: .red).previewLayout(.sizeThatFits)
    }
}


