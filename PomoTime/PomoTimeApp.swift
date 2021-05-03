//
//  PomoTimeApp.swift
//  PomoTime
//
//  Created by Sam Obe on 4/25/21.
//

import SwiftUI

@main
struct PomoTimeApp: App {
    
    @StateObject var contentViewModel = ContentViewModel()
    @StateObject var pomoViewModel = TimerViewModel(minutes: 25)
    @StateObject var shortViewModel = TimerViewModel(minutes: 5)
    @StateObject var longViewModel = TimerViewModel(minutes: 15)
    var body: some Scene {
        WindowGroup {
            ContentView(contentViewModel: contentViewModel, pomoViewModel: pomoViewModel, shortViewModel: shortViewModel, longViewModel: longViewModel )
        }
    }
}
