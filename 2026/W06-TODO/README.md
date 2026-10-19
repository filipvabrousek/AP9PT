# W06 — TODO aplikace

Slovo agenta 🟠 = tuhle část kódu napsal agent (Claude Code); ostatní jste psali ručně.

**Týden 6 · 19.–23. 10. 2026** · fáze 2 — *naučit se zadávat* (kód píše agent, vy ho čtete a schvalujete)

Co se učíme: sdílení dat mezi views (`@EnvironmentObject` a `@Observable`), `.environment` a `@Environment`,
`@Bindable`, `List` a mazání tahem, sheet. Cvičení: TODO aplikace od agenta, kterou pak upravujete ručně.

| Skupina | Datum | Kód |
|---|---|---|
| `monday-sk-1/` — pondělí 10:00 | 19. 10. | `Observable-sheet-MANUAL` (`MyApp.swift`: sdílený model s `@Observable` předaný přes `.environment` dvěma views, sheet otevřený z modelu přes `@Bindable` a zavřený `dismiss()`, vypočítaná vlastnost – psané ručně) · `TodoList` (TODO aplikace od agenta 🟠 – `@Observable` úložiště, `List`, mazání tahem, přidávání nahoře v seznamu) · v `ContentView.swift` ručně: alert při pokusu přidat prázdný úkol |
| `monday-sk-2/` — pondělí 14:00 | 19. 10. | `Todos` (TODO aplikace od agenta 🟠 – `TodoStore` jako starší `ObservableObject` předaný přes `.environmentObject`, odškrtnutí, přeškrtnutí hotových, počet zbývajících, „Clear Done“, přesouvání a mazání tahem, přidávání nahoře v seznamu; v `ContentView.swift` ručně alert při pokusu přidat prázdný úkol) · `19-10-26-sk2` (`MyApp.swift`: BMI kalkulačka se `Slider`y psaná ručně – dohnáno z týdne 5 · `DataShare.swift`: sdílený model s `@Observable` předaný přes `.environment` dvěma views a sheet otevřený z modelu přes `@Bindable`, psané ručně) |
