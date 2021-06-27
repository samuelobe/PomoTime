//
//  ContentView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contentViewModel = ContentViewModel()
    @StateObject var pomoViewModel = TimerViewModel(minutes: 25)
    @StateObject var shortViewModel = TimerViewModel(minutes: 5)
    @StateObject var longViewModel = TimerViewModel(minutes: 15)

    
    
    var body: some View {
        
        TabView {
            PomoView(pomoViewModel: pomoViewModel, shortViewModel: shortViewModel, longViewModel: longViewModel).tabItem {
                Image(systemName: "timer")
            }
            SettingsView().tabItem {
                Image(systemName: "gearshape.fill")
            }
        }.environmentObject(contentViewModel)
    }
}

struct TaskCell: View {
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25).padding(.leading)
            Text(task.taskName)
                .font(.title)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
