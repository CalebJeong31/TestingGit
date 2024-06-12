//
//  Todoitem.swift
//  FastSwiftBasic
//
//  Created by 주영정 on 6/11/24.
//
import Foundation

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
