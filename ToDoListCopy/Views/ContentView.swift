//
//  ContentView.swift
//  ToDoList
//
//  Created by Songyuan Liu on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Your To-Do List 📝")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    if viewModel.tasks.isEmpty {
                        Text("No Tasks yet!")
                            .font(.title3)
                    } else {
                        ForEach(viewModel.tasks.prefix(3), id: \.self) { task in
                            TaskItemView(task: task)
                        }
                    }
                
                }
            }
            .toolbar {
                NavigationLink(destination: FullTaskListView()) {
                    Text("View All")
                }
            }
            .padding()
        }
        
        
    }
}

#Preview {
    ContentView()
        .environment(TodoListViewModel())
}
