import Foundation

struct Todo: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var isDone = false
}
