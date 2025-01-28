//
//  TaskItemView.swift
//  ToDoList
//
//  Created by Songyuan Liu on 1/27/25.
//

import SwiftUI

struct TaskItemView: View {
    @EnvironmentObject var videModel: TodoListViewModel
    @State private var isChecked = false
    var task: TodoItem
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .font(.title)
                .onTapGesture {
                    withAnimation {
                        isChecked.toggle()
                        if isChecked {
                            videModel.remove(id: task.id)
                        }
                    }
                    
                }

            
            VStack(alignment: .leading) {
                Text(task.name)
                    .strikethrough(isChecked, color: .black)
                Text("Due \(formattedDate(task.dueDate))")
                    .foregroundColor(.gray)
                

            }
            Spacer()
        }
        .padding()
        
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: date)
    }
}

#Preview {
    TaskItemView(task: TodoItem(name: "task 1", dueDate: Date()))
        .environment(TodoListViewModel())
}
