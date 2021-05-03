//
//  ContentViewModel.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import Foundation


class ContentViewModel: ObservableObject {
    @Published var selected = 0
    @Published var numPomoCycles = 0
    
    static func testState() -> ContentViewModel {
        let viewModel = ContentViewModel()
        
        return viewModel
    }
    
}
