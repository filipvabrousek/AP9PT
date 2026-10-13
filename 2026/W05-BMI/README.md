# W05 — BMI kalkulačka

*Slovo $\color{orange}\textsf{agenta}$ oranžově = tuhle část kódu napsal agent (Claude Code); ostatní jste psali ručně.*

**Týden 5 · 12.–16. 10. 2026** · fáze 2 — *naučit se zadávat* (kód píše agent, vy ho čtete a schvalujete)

Co se učíme: `@State` a `@Binding`, prefix `$`, `TextField`, `Form`, `Section`, kontrola vstupu
a chybové stavy. Cvičení: BMI kalkulačka s barevně odlišenými kategoriemi.

| Skupina | Datum | Kód |
|---|---|---|
| `monday-sk-1/` — pondělí 10:00 | 12. 10. | `CircleGuess` (`ForEachFile-MANUAL.swift`: cyklus `ForEach` psaný ručně – klepnutím hledáte správný index · `CircleGuessGameView.swift`: hra na hádání kruhu od $\color{orange}\textsf{agenta}$) · `BMICalculator` (`BMICalculatorApp.swift`: BMI kalkulačka od $\color{orange}\textsf{agenta}$ – posuvníky, metrické/imperiální jednotky, barevné kategorie, `@Binding` v `LabeledSlider` · `TextField-Slider-MANUAL.swift`: `TextField` a `Slider` psané ručně) |
| `monday-sk-2/` — pondělí 14:00 | 12. 10. | `12-10-26-sk-2-monday` (`LoopView.swift`: cyklus `ForEach` psaný ručně – dlouhý seznam ve `ScrollView` · `MyApp.swift`: `@Binding` ručně – `WrapperView` předává `$counter` do `ReadView`) · `BMICalculator` (`BMICalculatorApp.swift`: BMI kalkulačka od $\color{orange}\textsf{agenta}$ – `Form`, metrické/imperiální jednotky, posuvníky, barevná škála, `@Binding` ve `ValueSlider` · `MyField.swift`: psané ručně – `Slider`, `TextField`, `SecureField` s kontrolou hesla, `alert`, formátování textu) |
| `tuesday-sk-1/` — úterý 10:00 | 13. 10. | `GuessCircleGame` (`ContentView.swift`: hra na hádání kruhu od $\color{orange}\textsf{agenta}$ · `ForEach-Simple.swift`: cyklus `ForEach` psaný ručně – klepnutím hledáte správný index) · `BMI-by-hand-13-10-26-sk1` (`MyApp.swift`: BMI kalkulačka psaná ručně – dva `Slider`y, výpočet jako computed property, kontrola `isNaN`; `AlertView` – alert psaný ručně) · `BMI` (`ContentView.swift`: BMI kalkulačka od $\color{orange}\textsf{agenta}$ – `Form`, posuvníky, barevné kategorie · `MySlider.swift`: `Slider` a `TextField` psané ručně) |
| `tuesday-sk-2/` — úterý 15:00 | 13. 10. | `GuessCircle` (`ContentView.swift`: hra na hádání kruhu od $\color{orange}\textsf{agenta}$ · `OurForEach.swift`: cyklus `ForEach` psaný ručně – klepnutím hledáte správný index) · `13-10-26-sk2` (`MyApp.swift`: `@Binding` psaný ručně – `MyView` předává `$test` do `BoundView`) · `BMIApp` (`ContentView.swift` + `BMI.swift`: BMI kalkulačka od $\color{orange}\textsf{agenta}$ – posuvníky, metrické/imperiální jednotky, barevná škála · `BMIAppApp.swift`: psané ručně – BMI se dvěma `Slider`y, `TextField`, alert) |
| `thursday-sk-1/` — čtvrtek 16:00 | 15. 10. | (zatím nenahráno) |

> **Hru na hádání kruhu napsal agent Claude (Claude Code).** Soubory s `-MANUAL` v názvu jste psali ručně.
