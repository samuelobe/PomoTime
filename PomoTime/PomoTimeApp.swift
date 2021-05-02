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
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: contentViewModel)
        }
    }
}
