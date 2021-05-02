//
//  Helpers.swift
//  PomoTime
//
//  Created by Sam Obe on 4/27/21.
//

import Foundation

func timeString(time: Int) -> String {
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%02i:%02i", minutes, seconds)
}
