//
//  State_16_10_25_sk_1App.swift
//  State-16-10-25-sk-1
//
//  Created by Filip Vabroušek on 16.10.2025.
//

import SwiftUI

@main
struct State_16_10_25_sk_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct StateApp: View {
    @State var counter = 0
    
    var body: some View {
        VStack {
            Text("State in Text \(counter)")
                .foregroundStyle(counter > 3 ? .green : .orange)
                .font(.largeTitle)
            
            Button("Count: \(counter)"){
                counter += 1
            }.font(.largeTitle)
                .bold()
            
            if counter > 3 {
                Text("Counter has reached 3")
                    .bold()
                    .font(.largeTitle)
            }
            
            if counter == 3 {
                Text("Counter is equal to 3")
                    .bold()
                    .font(.largeTitle)
            }
            
            
            
        }
    }
}


struct EvenOddView: View {
    @State var counter = 0
    
    var body: some View {
        
        VStack {
            
            Button("Click me"){
                counter += 1
            }
            
            
            Text("Green on Even, Orange on Odd counter values")
                .foregroundStyle(counter.isMultiple(of: 2) ? .green : .orange)
            
            
        }.font(.largeTitle)
    }
}




struct TwoWay: View {
    @State var text = ""
    
    var body: some View {
        ScrollView {
            
            
            VStack {
                TextField("Enter text", text: $text)
                
                Text(text)
                    .foregroundStyle(.orange)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(text.count % 2 == 0 ? 30 : -30))
                
                Text(text)
                    .foregroundStyle(.green)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(-30))
                
                Text(text)
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(60))
                
            }
        }
    }
}


enum LogState {
    case ok
    case notok
    case noshow
}

struct LoginView: View {
    // username == admin
    // password == 123456
    // username field
    // login button
    // OK => View Green text OK
    // BAD => View Orange state NOT OK
    
    @State var username = ""
    @State var password = ""
    @State var isLoggedIn: String = "noshow"
    @State var isLoggedInEnum: LogState = .noshow
    
    var body: some View {
        VStack {
          
            ExtractedFields(username: $username,
                            password: $password)
            
            
            ExtractedRest(username: $username,
                          password: $password,
                          isLoggedIn: $isLoggedInEnum)
            
        }.padding()
    }
}


struct ExtractedFields: View {
    var username: Binding<String>
    var password: Binding<String>
    
    var body: some View {
        TextField("Enter username", text: username)
            .textInputAutocapitalization(.never)
        
        SecureField("Password", text: password)
            .textInputAutocapitalization(.never)
    }
}


struct ExtractedRest: View {
    var username: Binding<String>
    var password: Binding<String>
    var isLoggedIn: Binding<LogState>
    
    var body: some View {
        Button("Log in"){
            if username.wrappedValue == "admin" && password.wrappedValue == "123456" {
                isLoggedIn.wrappedValue = .ok
            } else {
                isLoggedIn.wrappedValue = .notok
            }
        }
        
        if (isLoggedIn.wrappedValue == .ok){
            Text("Correct").foregroundStyle(.green)
        } else if (isLoggedIn.wrappedValue == .notok) {
            Text("Not OK").foregroundStyle(.orange)
        }
    }
}


#Preview {
    LoginView()
}
