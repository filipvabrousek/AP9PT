import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

// DATA REPO
@Observable
final class Shared {
    var counter = 0
    var showSheet = false
    
    var myText: String {
        if counter >= 10 { // > 1 covers all the rest, beggin with the 1st one
            return "10/10"
        } else if counter > 4 {
            return "Keep going"
        } else if counter > 1 {
            return "More than one"
        }
        
        return ""
    }
    
    func getText() -> String {
        if counter >= 10 {
            return "10/10"
        } else if counter > 4 {
            return "Keep going"
        } else if counter > 1 {
            return "More than one"
        }
        
        return ""
    }
}

struct RootView: View {
    @State private var shared = Shared()
    
    var body: some View {
        ChildView().environment(shared)
        IncreaseView().environment(shared)
    }
}


struct IncreaseView: View {
    @Environment(Shared.self) private var model
    
    var body: some View {
        Text(model.myText)
        Button("Increase \(model.counter)"){
            model.counter += 1
            /*if (model.counter > 3){
                model.showSheet = true
            }*/
        }.font(.largeTitle)
    }
}

struct ChildView: View {
    @Environment(Shared.self) private var model

    var body: some View {
        @Bindable var model = model

        Text("Count is \(model.counter)")

        Button("Show sheet"){
            model.showSheet = true
        }.sheet(isPresented: $model.showSheet) {
            SheetView()
        }
    }
}

// dismiss must be read inside the sheet, not in the view that presents it
struct SheetView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Text("Sheet")

        Button("Close"){
            dismiss()
        }
    }
}
