import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           AlertView()
        }
    }
}


struct StateView: View {
    @State var counter = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button("Increase"){
                counter += 1
            }.foregroundStyle(counter > 3 ? .green : .orange)
            
            // decrement button
            Button("Decrease"){
                counter -= 1
            }
            
            BoundView(value: $counter)
            // if counter > 3, make button orange
        }.font(.largeTitle)
        
        }
}

// Binding
struct BoundView: View {
    var value: Binding<Int>
    
    var body: some View {
        Text("Bound value **\(value.wrappedValue)**")
            .font(.system(size: 30))
            .foregroundStyle(.green)
    }
}


struct AlertView: View {
    @State var showAlert = false
    
    var body: some View {
        Button("Show alert"){
            showAlert.toggle()
            
        } // showAlert = !showAlert
        // confirmationDialog
        .alert("Some alert", isPresented: $showAlert){
            Button("OK"){
            }
            
            Button("Cancel"){
            }
        } message: {
            Text("Confirm deletion")
        }
    }
}
