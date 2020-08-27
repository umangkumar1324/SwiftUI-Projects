//
//  TaskCellViewModel.swift
//  fireBaseToDo
//
//  Created by Umang Kumar on 8/21/20.
//  Copyright © 2020 Umang Kumar. All rights reserved.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable{
    @Published var task: Task
    var id = ""
    @Published var completionStateIconName = ""
    private var cancellable = Set<AnyCancellable>()
    
    init(task:Task){
        self.task = task
        $task
            .map{ task in
            task.completed ? "checkmark.circle.fill" : "circle"
        }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellable)
        
        $task
            .map{ task in
                task.id}
            .assign(to: \.id, on: self)
            .store(in: &cancellable)
            
        
    }
}
