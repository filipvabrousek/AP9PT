# Plan - subject to change

# Prez 

### 21/10
* UIKit Storyboard ✅
* programmatic basics ✅
* Extensions ✅
* viewModifier ✅
* API fetch ✅

### 28/10
* státní svátek ✅

### 29/10
* samostatná práce ✅
  
### 04/11
* 10:00 - 11:40 cvičení odpadá (AMOK) ✅
* 16:00 - 17:40 cvičení proběhne ✅
* NavigationStack (2. skup) ✅
* MapKit basics (2. skup) ✅

### 11/11
* NavigationStack, Mapkit basics (1. skup) ✅
* LazyVGrid, LazyHGrid  ✅
* Timer app  ✅

### 12/11
* MapKit  (2. skup 12/11) ✅
* LazyVGrid, LazyHGrid 1.sk ✅
* Timer app (Game) ✅

### 18/11 
* **(sk.1)** *
* Game ✅

* **sk. 2.:**
* watchOS app  ✅
* UIViewRepresentable ✅
* UIHostingController ✅

----------------------------------------------------------------------------------------------------------------
### 25/11

#### **sk 1**
* UIHostingController ✅
* UIViewRepresentable ✅
* watchOS (Stepper, SF Symbols, navigation) ✅
* visionOS (basics, Space, 3D) ✅
* https://deadsimplescreensharing.com/

#### **sk2**
* visionOS Basics ✅
* visionOS Immersive space ✅
* Model3D ✅

### 26/11 
#### ***sk 2***
* visionOS Basics ✅
* visionOS Immersive space ✅
* Model3D ✅
* App Intents ✅ (dokončíme během 5 min na dalším cvičení)
* Apple Intelligence ✅
  

----------------------------------------------------------------------------------------------------------------
## Prosinec
## sk:1 10-12 (pondělí 02/12) 
* App Intents
* Apple Intelligence

## sk2: 16-18 + sk: 3 (úterý 03/12)
* SZZ otázky poskytnout
* termín testu pro zájemce (09/12)
* práce na projektech

### navíc pro sk. 3 (úterý 03/12)
změny v souboru ```TaskNumberIntent.swift```
```swift
@AssistantIntent(schema: .system.search)
struct TaskNumberIntent: AppIntent {
    static var title: LocalizedStringResource = "Number of tasks"
    
    static var searchScopes: [StringSearchScope] = [.general]

```

AppShortcut.swift
```swift
import AppIntents

@available(iOS 18.0, *)
struct ShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: TaskNumberIntent(),
                    phrases: ["My task number"],
                    shortTitle: "Task number", systemImageName: "sparkle.magnifyingglass")
    }
    
    static var shortcutTileColor: ShortcutTileColor = .orange
}
```
  








# Kombi
### Kombi pre-last 15/11
* API fetch  ✅
* App Icon  ✅
* visionOS ✅
* Storyboard  ✅
* UIViewRepresentable  ✅
* UIHostingController ✅
* pre-last presentation   ✅



# SZZ otázky

* 7. Stručné představení mobilní platformy iOS a běžně používaných vývojářských nástrojů.
Vývojářské účty pro implementaci a distribuci iOS aplikací. Rozdělení iOS frameworků a stručné
představení návrhového vzoru MVC v rámci vývoje iOS aplikací.  ✅

* 18. Možnosti návrhu uživatelského rozhraní mobilní aplikace na platformě iOS – stručný popis
principu návrhu rozhraní pomocí Storyboard. Představení frameworku UIKit a základní
funkcionality, které poskytuje. Stručné představení frameworku SwiftuUI a hlavní výhody oproti
použití UIKit.  ✅



### Kombi-last
* SZZ otázky   ✅
* NavigationStack  ✅
* watchOS
* App Intents 
* visionOS Immersive spaces
* MapKit
* CoreLocation
* Apple Intelligence

  
