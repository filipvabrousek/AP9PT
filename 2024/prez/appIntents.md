## App Intents


## ShortcutsProvider
```swift
@available(macCatalyst 18.0, iOS 18.0, *)
struct ShortuctsProvider: AppShortcutsProvider { // Neither struct nor class works
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: TaskNumberIntent(),
                    phrases: ["Number of tasks in Eveny"],
                    shortTitle: "Number of tasks",
                    systemImageName: "sparkle.magnifyingglass")
    }
    
    static var shortcutTileColor: ShortcutTileColor = .orange
}
```

```swift
@available(macCatalyst 18.0, iOS 18.0, *)
@AssistantIntent(schema: .system.search) // The "Search" title comes automaticaly from this
    struct TaskNumberIntent: AppIntent {
        static var title: LocalizedStringResource = "Number of tasks"
       
        static var searchScopes: [StringSearchScope] = [.general]
        
        @Parameter(title: "Criteria")
        var criteria: StringSearchCriteria // add picker?
        
        @Dependency
        var model: Passer
    
        // Filter tasks, textField needs to be here
        @MainActor
        func perform() async throws -> some IntentResult & ReturnsValue<Int> & ProvidesDialog {
            let filteredTasks: [Task] = {
                if !criteria.term.isEmpty {
                    return model.tasks.filter { $0.title.lowercased().starts(with: criteria.term.lowercased()) }
                } else {
                           return model.tasks
                       }
                   }()

            
            if model.tasks.count > 0 && filteredTasks.count > 0 {
                return .result(
                    value: filteredTasks.count,
                    dialog: .init("Task \(filteredTasks[0].title) is due at \(filteredTasks[0].due)")
                )
            }
            
            return .result(
                value: 0,
                dialog: .init("No tasks found")
            )
        }
    }

```


```swift
class Passer: ObservableObject {
    @Published var tasks = [Task]()

    func fetch() {
        let m = TaskManager(ename: "Tasks", key: "tasks", obj: .init(title: "", due: "", content: "", subject: "", color: "", CZDate: "", CZHour: ""))
        tasks = m.fetchU()
    }
}
```


# SceneDelegate.swift

```swift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var mana: Passer? = nil
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Get the managed object context from the shared persistent container.
        //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let context = PersistenceService.persistentContainer.viewContext
        
        let man = Passer()
        if #available(iOS 16.0, *) {
            AppDependencyManager.shared.add(dependency: man)
        } else {
            // Fallback on earlier versions
        }
        man.fetch()
        mana = man
        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
      
       // ShortcutsP
        // TaskNumberIntent
        //  TrailShortcuts.updateAppShortcutParameters()
        
        if #available(macCatalyst 18.0, iOS 18.0, *) {
            
                ShortuctsProvider.updateAppShortcutParameters()
          
        } else {
            // Fallback on earlier versions
        }
```
