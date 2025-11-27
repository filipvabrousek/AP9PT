//
//  SwiftUI_sheet_appApp.swift
//  SwiftUI-sheet-app
//
//  Created by Filip Vabroušek on 27/11/25.
//

// CORE DATA
import SwiftUI
import SwiftData
import Combine

class EO: ObservableObject {
    @Published var text = ""
}

@main
struct SwiftUI_sheet_appApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    let e = EO()
    
    var body: some Scene {
        WindowGroup {
            SheetView()
                .environmentObject(e)
        }
        .modelContainer(sharedModelContainer)
    }
}






// SHEET
struct SheetView: View {
    @EnvironmentObject var e: EO
    @State var showSheet: Bool = false
    var body: some View {
        Button("Sheet"){
            e.text = "Hello"
            showSheet.toggle()
        }.sheet(isPresented: $showSheet) {
            InnerView()//.environmentObject(e)
        }
    }
}



struct InnerView: View {
    @EnvironmentObject var e: EO
    @State var showSheet: Bool = false
    var body: some View {
        Text(e.text).bold()
    }
}

// VISIONOS
// USERDEFAULTS
