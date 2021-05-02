//
//  ContentView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : ContentViewModel
    
    @StateObject var pomoViewModel = PomoViewModel(minutes: 1)
    @StateObject var shortViewModel = ShortViewModel()
    @StateObject var longViewModel = LongViewModel()
    
    var body: some View {
            
        let pomoView = PomoView(viewModel: pomoViewModel)
        let shortView = ShortView(viewModel: shortViewModel)
        let longView = LongView(viewModel: longViewModel)
        
            VStack {
                Picker(selection: $viewModel.selected, label: Text(""), content: {
                    Text("Pomodoro").tag(0)
                    Text("Short Break").tag(1)
                    Text("Long Break").tag(2)
                }).pickerStyle(SegmentedPickerStyle()).padding()
                
                switch viewModel.selected {
                case 0:
                    pomoView
                case 1:
                    shortView
                case 2:
                    longView
                default:
                    pomoView
                }
             
            }.environmentObject(viewModel)
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
        ContentView(viewModel: ContentViewModel.testState())
        
    }
}
