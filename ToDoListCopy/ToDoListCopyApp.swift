//
//  ToDoListCopyApp.swift
//  ToDoListCopy
//
//  Created by Songyuan Liu on 1/27/25.
//

import SwiftUI

@main
struct ToDoListCopyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(TodoListViewModel())
        }
    }
}
