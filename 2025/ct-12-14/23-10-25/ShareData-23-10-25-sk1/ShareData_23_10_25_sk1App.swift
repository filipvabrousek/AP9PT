//
//  ShareData_23_10_25_sk1App.swift
//  ShareData-23-10-25-sk1
//
//  Created by Filip Vabroušek on 23.10.2025.
//

import SwiftUI
import Combine

// 1 ---------------- SHARED DATA STORE
class SharedShareData: ObservableObject {
    @Published var counter = 0
}

// 2 ---------------- MAIN APP STRUCT
// Create instance of SharedShareData only once
// use .environmentObject(sharedData) to add this object to view hiearchy
@main
struct ShareData_23_10_25_sk1App: App {
    var sharedData = SharedShareData()
    
    var body: some Scene {
        WindowGroup {
          
            ModalsConfirmationDialog()
            BView().border(Color.orange)
            //  Modals()
         // NavViewDynamic()
            // WrapView() // for state 
                .environmentObject(sharedData)
        }
    }
}

// 3 ---------------- use @EnvironmentObject to use SharedData
// Wrap view automatically passes store to children
struct WrapView: View {
    @EnvironmentObject var data: SharedShareData
    
    var body: some View {
        VStack {
            Spacer()
            AView(data: data).border(Color.orange)
            Spacer()
            BView().border(Color.orange)
            Spacer()
        }.font(.largeTitle)
    }
}


// 3 ---------------- Children can read and edit values
struct AView: View {
  //  @EnvironmentObject var data: SharedShareData
 
    // I need to pass instance using observedObject
    @ObservedObject var data: SharedShareData
    
    var body: some View {
        Text("A \(data.counter)")
        
        Button("Change from A view"){
            data.counter += 1
        }
    }
}


struct BView: View {
    @EnvironmentObject var data: SharedShareData
    var body: some View {
        Text("B \(data.counter)")
        
        Button("Change from B view"){
            data.counter += 1
        }
    }
}








































// Counter
// Button and Text
// if i % 2 == 0 green else orange
// change font weight (bold =>odd     even => black)


struct SwitchView: View {
    
    @State var counter = 0
    
    var body: some View {
        VStack{
            Button("Tap"){
                counter += 1
            }
            
            Text("Colored")
                .foregroundStyle(counter % 2 == 0 ? .green : .orange)
                .font(counter % 2 == 0 ? .system(size: 21, weight: .bold) : .system(size: 21, weight: .black))
               
        }
    }
}


#Preview {
    SwitchView()
}
