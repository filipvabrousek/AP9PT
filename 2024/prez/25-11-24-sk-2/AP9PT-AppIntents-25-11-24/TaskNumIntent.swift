//
//  TaskNumIntent.swift
//  AP9PT-AppIntents-25-11-24
//
//  Created by Filip Vabroušek on 11/25/24.
//

import Foundation
import AppIntents




/*
@available(macCatalyst 18.0, iOS 18.0, *)
@AssistantIntent(schema: .system.search) // The "Search" title comes automaticaly from this
    struct TaskNumberIntent: AppIntent {
        static var title: LocalizedStringResource = "Number of tasks"
       
        static var searchScopes: [StringSearchScope] = [.general]
        
        @Parameter(title: "Criteria")
        var criteria: StringSearchCriteria // add picker?
        
        @Dependency
        var model: Passer
    
        // Filter tasks, textField needs to be here
        @MainActor
        func perform() async throws -> some IntentResult & ReturnsValue<Int> & ProvidesDialog {
            
            
            let filteredTasks: [Task] = {
                       if !criteria.term.isEmpty {
                           return model.filter(by: criteria.term) // Assuming `filter(by:)` is defined in `Passer`
                       } else {
                           return model.fetch() // Fetch all tasks if no criteria are provided
                       }
                   }()
            
            if model.tasks.count > 0 && filteredTasks.count > 0 {
                return .result(
                    value: filteredTasks.count,
                    dialog: .init("Task \(filteredTasks[0]) has been found.")
                )
            }
            
           // let filteredTasks: [Task]  = [model.tasks[0]]
            
           /* let filteredTasks: [Task] = {
                if !criteria.term.isEmpty {
                    return model.filter(by: criteria.term)
                } else {
                    return model.fetch()
                       }
                   }()*/

            
           /* if model.tasks.count > 0 && filteredTasks.count > 0 {
                return .result(
                    value: filteredTasks.count,
                    dialog: .init("Task \(filteredTasks[0]) has been found.")
                )
            }
            
            return .result(
                value: 0,
                dialog: .init("No tasks found")
            )*/
            
            return .result(
                value: 0,
                dialog: .init("No tasks found")
            )
        }
    }
*/

@available(macCatalyst 18.0, iOS 18.0, *)
@AssistantIntent(schema: .system.search) // The "Search" title comes automaticaly from this // try OpenIntent like with Runny to remove text field
    struct TaskNumberIntent: AppIntent { // GetResult
        static var title: LocalizedStringResource = "Number of tasks"
        // Search is not the best schema here, we shouldn't need to enter anything
        static var searchScopes: [StringSearchScope] = [.general]
        
        @Parameter(title: "Criteria")
        var criteria: StringSearchCriteria // add picker?
        
        @Dependency
        var model: Passer
    
        // Filter tasks, textField needs to be here
        @MainActor
        func perform() async throws -> some IntentResult & ReturnsValue<Int> & ProvidesDialog {
            let filteredTasks: [String] = {
                if !criteria.term.isEmpty {
                    return model.tasks.filter { $0.lowercased().starts(with: criteria.term.lowercased()) }
                } else {
                           return model.tasks
                       }
                   }()

            
            if model.tasks.count > 0 && filteredTasks.count > 0 {
                // Remove text field
              /*  let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yy" // or whatever format your date strings are in

                let latestTask = model.tasks.sorted {
                    guard let date1 = dateFormatter.date(from: String($0.due.suffix(8))),
                          let date2 = dateFormatter.date(from: String($1.due.suffix(8))) else {
                        return false // Handle invalid dates here
                    }
                    return date1 > date2
                }
                */
                
                // Returning the result with the filtered tasks count
                return .result(
                    value: filteredTasks.count, // 162910 04/10
                   // dialog: .init(stringLiteral: "Date \(latestTask[0].due) LT \(latestTask[0].title)")
                    dialog: .init("Task \(filteredTasks[0]) is due at ") // 155937
                ) // 19:45:58 04/10/24 works!!!
            }
            
            return .result(
                value: 0,
                dialog: .init("No tasks found") // 155937
            )
        }
        
        
        
    }

