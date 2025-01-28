//
//  TodoListViewModel.swift
//  ToDoList
//
//  Created by Songyuan Liu on 1/27/25.
//

import Foundation

@Observable
class TodoListViewModel: ObservableObject {
    var tasks: [TodoItem] = []
    
    func addTodoItem(name: String, dueDate: Date) {
        tasks.append(TodoItem(name: name, dueDate: dueDate))
    }
    
    func remove(id: UUID) {
        tasks.removeAll {
            $0.id == id
        }
    }

}

struct TodoItem: Hashable {
    let id: UUID = UUID()
    let name: String
    let dueDate: Date
    var isCompleted: Bool = false
}
