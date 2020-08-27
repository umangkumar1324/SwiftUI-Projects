//
//  Task.swift
//  fireBaseToDo
//
//  Created by Umang Kumar on 8/20/20.
//  Copyright © 2020 Umang Kumar. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

let testDataTasks = [
    Task(title: "Implemet the Ui", completed : true),
    Task(title: "Connect to firebase", completed : false),
    Task(title: "???????", completed : false),
    Task(title: "Profit", completed : false)
]
