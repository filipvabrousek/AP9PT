**Možnosti návrhu uživatelského rozhraní mobilní aplikace na platformě iOS – stručný popis principu návrhu rozhraní pomocí Storyboard. Představení frameworku UIKit a základní funkcionality, které poskytuje. Stručné představení frameworku SwiftuUI a hlavní výhody oproti použití UIKit.**

## Návrh rozhraní pomocí **Storyboard**
- Storyboard je vizuální nástroj integrovaný v Xcode.  
- Umožňuje grafické vytváření uživatelského rozhraní pomocí drag-and-drop prvků.  
- Obsahuje scény (obrazovky) a segues (přechody mezi obrazovkami).  
- Umožňuje snadnou vizualizaci navigace aplikace (např. přechody mezi obrazovkami).  
- K jednotlivým prvkům lze připojovat kód pomocí **IBOutlet** a **IBAction**.  
- Vhodné pro menší a středně velké projekty.  

## Framework **UIKit**  
UIKit je tradiční framework pro vytváření uživatelského rozhraní v iOS aplikacích.  

### Základní funkcionality, které poskytuje:
- **Správa rozvržení (Layout)**: Umožňuje vytvářet statická i dynamická rozvržení pomocí Auto Layout.  
- **Komponenty uživatelského rozhraní**: Obsahuje prvky jako `UILabel`, `UIButton`, `UITableView`, `UICollectionView`.  
- **Ovládání interakcí**: Poskytuje API pro dotyková gesta, přetahování a další vstupy uživatele.  
- **Animace**: Možnost vytvářet komplexní animace, přechody a transformace.  
- **Navigace a řízení obrazovek**: Třídy jako `UINavigationController` a `UITabBarController`.  
- **Integrace médií**: Práce s obrázky, zvukem a videem (```UIImageView```)

### Výhody UIKit
- Dlouhodobě zavedený framework, široká komunita a rozsáhlá dokumentace.  
- Vysoká míra přizpůsobitelnosti.  
- Podpora starších verzí iOS.  

## Framework **SwiftUI**  
SwiftUI je moderní, deklarativní framework pro tvorbu uživatelského rozhraní.  

### Klíčové vlastnosti a výhody:
- **Deklarativní syntaxe**: Návrh UI pomocí kódu, který popisuje, *co* má být zobrazeno, místo *jak*.  
  - Příklad:  
    ```swift
    Text("Hello, world!")
        .font(.headline)
        .foregroundColor(.blue)
    ```  
- **Automatická podpora Dark Mode**: UI se automaticky přizpůsobuje světlému a tmavému režimu.  
- **Dynamické náhledy**: Možnost okamžitě vidět změny v UI přímo v Xcode.  
- **Reaktivní přístup**: Automatická aktualizace UI při změnách stavu dat pomocí `@State`, `@Binding`, nebo `ObservableObject`.  
- **Multiplatformnost**: Podpora nejen iOS, ale také macOS, watchOS a tvOS.  

### Výhody oproti UIKit:
- Rychlejší vývoj díky přehledné a stručné syntaxi.  
- Snadnější práce s adaptivními a dynamickými rozvrženími.  
- Vhodnější pro moderní a nové aplikace.  

### Nevýhody:
- Omezená podpora starších verzí iOS (minimálně iOS 13).  
- Menší flexibilita ve srovnání s UIKit v některých pokročilých scénářích.  
