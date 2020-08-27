//
//  ContentView.swift
//  fireBaseToDo
//
//  Created by Umang Kumar on 8/20/20.
//  Copyright © 2020 Umang Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let tasking = testDataTasks
    
    @State var presentAddNewItem = false
    
    @ObservedObject var taskListVM = taskListViewModel()

    var body: some View {
        NavigationView{
        VStack(alignment: .leading) {
            List{
            ForEach(taskListVM.taskCellViewModel) { taskCellVM in
                TaskCell(taskCellVM: taskCellVM)
                }
                if presentAddNewItem{
                    TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))){ task in
                    self.taskListVM.addTask(task: task)
                    self.presentAddNewItem.toggle()
                    }
                }
            }
            Button(action: {self.presentAddNewItem.toggle()}) {
                HStack{
                Image(systemName:"plus.circle.fill")
                    .resizable()
                    .frame(width:20, height: 20)
                Text("Add new task")
                }
            }.padding()
            
            }.navigationBarTitle("Tasks")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM:TaskCellViewModel
    var onCommit: (Task)->(Void) = {_ in}
    var body: some View {
        HStack{
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill": "circle")
                .resizable()
                .frame(width:20, height:20)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
            }
            TextField("Enter text here", text: $taskCellVM.task.title, onCommit: {
                self.onCommit(self.taskCellVM.task )
            })
        }
    }
}
