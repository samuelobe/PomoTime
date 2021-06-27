//
//  PomoView.swift
//  PomoTime
//
//  Created by Sam Obe on 6/27/21.
//

import SwiftUI

struct PomoView: View {
    @ObservedObject var pomoViewModel : TimerViewModel
    @ObservedObject var shortViewModel : TimerViewModel
    @ObservedObject var longViewModel : TimerViewModel
    @EnvironmentObject var contentViewModel : ContentViewModel
    
    var body: some View {
        let pomoView = TimerView(viewModel: pomoViewModel, color: .red)
        let shortView = TimerView(viewModel: shortViewModel, color: .blue)
        let longView = TimerView(viewModel: longViewModel, color: .green)
        
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
            
        }
    }
}

//struct PomoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PomoView()
//    }
//}
