//
//  ContentView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contentViewModel : ContentViewModel
    @ObservedObject var pomoViewModel : TimerViewModel
    @ObservedObject var shortViewModel : TimerViewModel
    @ObservedObject var longViewModel : TimerViewModel
    

    var body: some View {
            
        let pomoView = PomoView(viewModel: pomoViewModel, color: .red)
        let shortView = PomoView(viewModel: shortViewModel, color: .blue)
        let longView = PomoView(viewModel: longViewModel, color: .green)
        
            VStack {
                Picker(selection: $contentViewModel.selected, label: Text(""), content: {
                    Text("Pomodoro").tag(0)
                    Text("Short Break").tag(1)
                    Text("Long Break").tag(2)
                }).pickerStyle(SegmentedPickerStyle()).padding()
                
                switch contentViewModel.selected {
                case 0:
                    pomoView
                case 1:
                    shortView
                case 2:
                    longView
                default:
                    pomoView
                }
             
            }.environmentObject(contentViewModel)
    }
}

struct TaskCell: View { // (5)
  var task: Task
  
  var body: some View {
    HStack() {
        Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 25, height: 25).padding(.leading) // (12)
        Text(task.taskName)
            .font(.title)
        Spacer()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentViewModel: ContentViewModel.testState(), pomoViewModel: TimerViewModel.testState(minutes: 1), shortViewModel: TimerViewModel.testState(minutes: 1), longViewModel: TimerViewModel.testState(minutes: 1))
        
    }
}
