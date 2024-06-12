//
//  TodoViewModel.swift
//  FastSwiftBasic
//
//  Created by 주영정 on 6/11/24.
//
import Combine

class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    
    func addItem(title: String) {
        let newItem = TodoItem(title: title)
        items.append(newItem)
    }
    
    func toggleCompletion(item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
}
