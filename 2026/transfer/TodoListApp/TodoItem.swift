import Foundation

struct TodoItem: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var isDone = false
}
