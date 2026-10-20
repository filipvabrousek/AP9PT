import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

@Observable
class Shared {
    var counter = 0
    var isShown = false
}

struct RootView: View {
    @State var shared = Shared()
    
    var body: some View {
        VStack {
            ChildView().environment(shared)
            SiblingView().environment(shared)
        }.font(.largeTitle)
    }
}

// Sheet

struct ChildView: View {
    @Environment(Shared.self) var model
    
    var body: some View {
        @Bindable var boundModel = model
        
        Button("Change count \(model.counter)"){
            model.counter += 1
            // 3 and more => Show sheet
            
            if model.counter > 3 {
                model.isShown = true
            }
            
        }.sheet(isPresented: $boundModel.isShown){
           SheetView()
        }
    }
}


struct SheetView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button("Close"){
            dismiss()
        }
    }
}


struct SiblingView: View {
    @Environment(Shared.self) var model
    
    var body: some View {
        Text("Counter \(model.counter)")
    }
}
