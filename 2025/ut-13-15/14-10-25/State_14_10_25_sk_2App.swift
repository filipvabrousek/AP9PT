//
//  State_14_10_25_sk_2App.swift
//  State-14-10-25-sk-2
//
//  Created by Filip Vabroušek on 14.10.2025.
//

import SwiftUI

@main
struct State_14_10_25_sk_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct StateView: View {
    @State var count = 0
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("I can also read the count \(count)")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(count > 3 ? Color.green : Color.orange)
            
            
            Button("Count is \(count)"){
                count += 1
            }
            .font(.largeTitle)
            .bold()
            
            if count > 3 {
                Text("Count is bigger than 3")
                    .bold()
                    .font(.largeTitle)
            }
            
        }
    }
}



struct EvenOddSwitcher: View {
    @State var count = 0
    
    var body: some View {
        VStack {
            Button("Count"){
                count += 1
              
            }
            
        
            Text("I will change color")
                .foregroundStyle(count % 2 == 0 ? Color.orange : Color.blue)
                .font(.largeTitle)
        }
    }
}



struct ViewShower: View {
    @State var isShown = false
    
    var body: some View {
        VStack {
            Button("Show hidden message"){
                isShown.toggle()
            }
            
            if isShown {
                Text("Show")
            }
            
        }.font(.largeTitle)
    }
}


struct TwoWay: View {
    @State var text = ""
    
    var body: some View {
        ScrollView {
            
            
            VStack(alignment: .leading) {
                TextField("Enter some text", text: $text)
                Text(text)
                    .foregroundStyle(.orange)
                    .rotationEffect(.degrees(text.count % 2 == 0 ? 30 : -30))
                
                Text(text)
                    .foregroundStyle(.green)
                    .rotationEffect(.degrees(60))
                    .rotationEffect(.degrees(text.count % 2 == 0 ? -30 : 30))
                
                Text(text)
                    .foregroundStyle(.blue)
                    .rotationEffect(.degrees(80))
                    .rotationEffect(.degrees(text.count % 2 == 0 ? 30 : -30))
            }.font(.largeTitle)
        }
    }
}



struct Rotate360View: View {
    @State var degrees = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Rotate me 360")
                .rotationEffect(.degrees(Double(degrees)))
                .font(.largeTitle)
            
            Button("Rotate"){
                withAnimation {
                    degrees == 3600 ? (degrees = 0) : (degrees = 3600)
                }
            }
        }
    }
}



struct LoginView: View {
    @State var username = ""
    @State var password = ""
    @State var showSuccess = false
    @State var showFailure = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Log-in")
            
           Extracted(username: $username,
                     password: $password)
            
            Button("Log-in"){
                if username == "admin" && password == "1234" {
                    showSuccess = true
                    showFailure = false
                } else {
                    showFailure = true
                    showSuccess = false
                }
            }
            
            if showSuccess {
                Text("Success").foregroundStyle(.green)
            }
            
            if showFailure {
                Text("Failure").foregroundStyle(.orange)
            }
            
            
            
        }.font(.largeTitle)
        
    }
}


struct Extracted: View {
    var username: Binding<String>
    var password: Binding<String>
    
    var body: some View {
        TextField("E-mail", text: username)
            .textInputAutocapitalization(.never)
        TextField("Password", text: password)
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    LoginView()
}
