import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           Wrapper()
        }
    }
}

@Observable
class SharedData {
    var counter = 0
    var isShown = false
}


struct Wrapper: View {
    var shared = SharedData()
    
    var body: some View {
        VStack {
            ChildView().environment(shared)
            SiblingView().environment(shared)
        }.font(.largeTitle)
    }
}

struct ChildView: View {
    @Environment(SharedData.self) var data
    
    var body: some View {
        @Bindable var bound = data
        
        Button("Data \(data.counter)"){
            data.counter += 1
            
            if data.counter > 3 {
                data.isShown = true
            }
            // if counter > 3, show sheet
        }.sheet(isPresented: $bound.isShown){
            DetailView()
        }
    }
}


struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Close"){
            dismiss()
        }
    }
}

struct SiblingView: View {
    @Environment(SharedData.self) var data
    
    var body: some View {
        Text("Data \(data.counter)")
            .foregroundStyle(.orange)
            .bold()
    }
}
// Obserable @Environemtn
