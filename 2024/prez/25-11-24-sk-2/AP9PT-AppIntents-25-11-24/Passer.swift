//
//  Passer.swift
//  AP9PT-AppIntents-25-11-24
//
//  Created by Filip Vabroušek on 11/25/24.
//

import SwiftUI

class TaskManager {
    var tasks: [String] = []
    
    func filter(by: String) -> [String] {
        return tasks.filter {$0.lowercased().starts(with: by.lowercased())}
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
        
       /* let filtered = m.filter(by: "Fi")
        print("Filtered tasks")
        print(filtered)*/
        
    }
    
    func filter(by: String) -> [String] {
        let m = TaskManager()
        m.fetch()
        
        let filtered = m.filter(by: by)
        print("Filtered tasks")
        print(filtered)
        tasks = filtered
        return filtered
    }
}
