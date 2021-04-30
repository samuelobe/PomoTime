//
//  Task.swift
//  PomoTime
//
//  Created by Sam Obe on 4/28/21.
//

import Foundation

struct Task: Identifiable{
    var taskName: String
    var id : String = UUID().uuidString
    var completed : Bool
    
}

let testTasks = [Task(taskName: "Complete EI HW",completed: false),
                 Task(taskName: "Complete TF2 HW",completed: false),
                 Task(taskName: "Complete CS1 HW", completed: false),
                 Task(taskName: "Complete EI HW",completed: false),
                 Task(taskName: "Complete TF2 HW",completed: false),
                 Task(taskName: "Complete CS1 HW", completed: false)]
