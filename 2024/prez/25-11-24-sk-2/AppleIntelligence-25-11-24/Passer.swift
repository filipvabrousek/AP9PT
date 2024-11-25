//
//  Passer.swift
//  AppleIntelligence-25-11-24
//
//  Created by student on 25.11.2024.
//

import Foundation

class TaskManager {
    var tasks: [String] = []
    
    func filter(by: String) -> [String] {
        return tasks.filter {
            $0.lowercased().starts(with: by.lowercased())
        }
    }
    
    func fetch() -> [String] {
        tasks.append("First")
        tasks.append("Second")
        tasks.append("Third")
        return tasks
    }
    
    
}

class Passer: ObservableObject {
    @Published var tasks = [String]()
    
    func fetch() {
        let m = TaskManager()
        tasks = m.fetch()
        
        print("TASKS")
        print(tasks)
    }
    
    func filter(by: String) -> [String] {
       let m = TaskManager()
        m.fetch()
        
        let filtered = m.filter(by: by)
        tasks = filtered
        return filtered
    }
}
