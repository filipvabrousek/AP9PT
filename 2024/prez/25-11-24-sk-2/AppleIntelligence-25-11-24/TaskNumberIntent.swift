//
//  TaskNumberIntent.swift
//  AppleIntelligence-25-11-24
//
//  Created by student on 25.11.2024.
//

import Foundation
import AppIntents

@available(iOS 18.0, *)
@AssistantIntent(schema: .system.search)
struct TaskNumberIntent: AppIntent {
    static var title: LocalizedStringResource = "Number of tasks"
    
    static var searchScopes: [StringSearchScope] = [.general]
    
    @Parameter(title: "Criteria")
    var criteria: StringSearchCriteria
    
    @Dependency
    var model: Passer
    
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<Int> & ProvidesDialog {
        
        
        let filteredTasks: [String] = {
           
            if !criteria.term.isEmpty {
                return model.tasks.filter {
                    $0.lowercased()
                        .starts(with: criteria.term.lowercased())
                }
                
            } else {
                return model.tasks
            }
        }()
        
        if model.tasks.count > 0 && filteredTasks.count > 0 {
            return .result(value: filteredTasks.count, 
                           dialog: .init("Task \(filteredTasks[0])"))
        }
        
        return .result(value: 0,
                       dialog: .init("No tasks found")
        )
        
        
        
    }
    
}

