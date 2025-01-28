//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Songyuan Liu on 1/27/25.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var taskTitle: String = ""
    @State private var dueDate: Date = Date()
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Add a new task")
                    .font(.title)
                Spacer()
            }
            .padding()
            
            
            // Demonstarte styling textfield by asking ChatGPT
            TextField("Your task description", text: $taskTitle)
                .padding() // Add padding inside the TextField
                    .background(Color(.systemGray6)) // Light gray background
                    .cornerRadius(8) // Rounded corners
                    .overlay(
                        RoundedRectangle(cornerRadius: 8) // Outline with rounded corners
                            .stroke(Color.blue, lineWidth: 1) // Blue border with 1pt width
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2) // Subtle shadow
                    .padding(.horizontal) // Add horizontal padding around the TextField
            
            
            HStack {
                Text("Due Date")
                    .font(.headline) // Style the label text
                    .foregroundColor(.gray) // Adjust text color
                    .padding(.leading) // Add some spacing to the left if needed

                DatePicker("", selection: $dueDate, displayedComponents: .date)
                    .labelsHidden() // Hides the default label of the DatePicker
                    .padding() // Add padding to the DatePicker
                    .background(Color(.systemGray6)) // Light gray background
                    .cornerRadius(8) // Rounded corners
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 1) // Add a border around the DatePicker
                    )
            }
            .padding(.horizontal) // Add horizontal padding for the entire HStack
            
            
            Button {
                viewModel.addTodoItem(name: taskTitle, dueDate: dueDate)
                dismiss()
            } label: {
                Text("Create")
                    .font(.headline)
                    .padding()
            }

            
        }
    }
}

#Preview {
    AddTaskView()
}
