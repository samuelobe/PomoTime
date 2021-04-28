//
//  ContentView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Picker(selection: $viewModel.selected, label: Text(""), content: {
                Text("Pomodoro").tag(0)
                Text("Short Break").tag(1)
                Text("Long Break").tag(2)
            }).pickerStyle(SegmentedPickerStyle()).padding()
            Spacer()
            switch viewModel.selected {
            case 0:
                PomoView()
            case 1:
                ShortView()
            case 2:
                LongView()
            default:
                PomoView()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
