//
//  State_16_10_25_sk_2App.swift
//  State-16-10-25-sk-2
//
//  Created by Filip Vabroušek on 16.10.2025.
//

import SwiftUI

@main
struct State_16_10_25_sk_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct StateView: View {
    @State var counter = 0
    
    var body: some View {
        VStack {
            
            
            Text("Count \(counter)")
            
            Button("Count \(counter)"){
                counter += 1
            }.font(.title).bold()
            
            
            Text("I will be green for values > 3")
                .foregroundStyle(counter > 3 ? .green : .orange)
                .font(.largeTitle)
            
            
            if counter > 3 {
                Text("Counter is bigger than 3")
                    .foregroundStyle(.green)
                    .padding()
                    .border(.orange)
                    
                
            }
            
            
            
            if counter == 3 {
                Text("Counter is equal than 3")
                    .foregroundStyle(.green)
                    .padding()
                    .border(.orange)
                    
                
            }
            
        }
    }
}



struct TwoWay: View {
    @State var text = ""
    
    var body: some View {
        ScrollView {
            
            
            VStack {
                TextField("Hello", text: $text)
                Text(text)
                    .foregroundStyle(.orange)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(text.count % 2 == 0 ? -30 : 30))
                
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

enum LoggedIn {
    case empty
    case ok
    case notok
}


struct LoginView: View {
    // password field
    // username field
    // button
    // username == "admin" password == 123456
    // OK => Green text
    // NOT OK => Orange text
    
    @State var password = ""
    @State var text = ""
    @State var loggedIn = "empty"
    @State var loggedInEnum: LoggedIn = .empty
    
    var body: some View {
        VStack {
            
            Fields(password: $password,
                   text: $text)
            
            Buttons(password: $password,
                    text: $text,
                    isloggedIn: $loggedInEnum)
            
            
            
            
            
            
            
        }.padding()
    }
}

struct Fields: View {
    var password: Binding<String>
    var text: Binding<String>
    
    var body: some View {
        TextField("Username", text: text)
            .textInputAutocapitalization(.never)
        
        SecureField("Password", text: password)
            .textInputAutocapitalization(.never)
    }
}

struct Buttons: View {
    var password: Binding<String>
    var text: Binding<String>
    var isloggedIn: Binding<LoggedIn>
    
    var body: some View {
        
        Button("Sign-in"){
            if text.wrappedValue == "admin" && password.wrappedValue == "123456" {
                isloggedIn.wrappedValue = .ok
            } else {
                isloggedIn.wrappedValue = .notok
            }
        }
        
        
        if isloggedIn.wrappedValue == .ok {
            Text("OK")
                .foregroundColor(.green)
            
        } else if (isloggedIn.wrappedValue == .notok) {
            Text("NOTOK")
                .foregroundStyle(.orange)
        }
    }
}
#Preview {
    LoginView()
}
