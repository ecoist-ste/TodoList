//
//  FullTaskListView.swift
//  ToDoList
//
//  Created by Songyuan Liu on 1/27/25.
//

import SwiftUI

struct FullTaskListView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if viewModel.tasks.isEmpty {
                        Text("No Tasks yet!")
                            .font(.title3)
                            .padding()
                    } else {
                        ForEach(viewModel.tasks, id: \.self) { task in
                            TaskItemView(task: task)
                        }
                    }
                }
                .padding()
            }
            .toolbar {
                Button {
                    showAddTaskView.toggle()
                } label: {
                    Text("Add a task")
                }
                .sheet(isPresented: $showAddTaskView) {
                    AddTaskView()
                }

            }
        }
        
    }
}

#Preview {
    FullTaskListView()
        .environment(TodoListViewModel())
}
