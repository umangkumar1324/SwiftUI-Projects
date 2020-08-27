//
//  taskListViewModel.swift
//  fireBaseToDo
//
//  Created by Umang Kumar on 8/21/20.
//  Copyright © 2020 Umang Kumar. All rights reserved.
//

import Foundation
import Combine

class taskListViewModel: ObservableObject{
    @Published var taskCellViewModel = [TaskCellViewModel]()
    private var countables = Set<AnyCancellable>()
    
    init(){
        self.taskCellViewModel = testDataTasks.map{task in
            TaskCellViewModel(task:task)
        }
    }
    
    func addTask(task:Task){
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModel.append(taskVM)
    }
}
