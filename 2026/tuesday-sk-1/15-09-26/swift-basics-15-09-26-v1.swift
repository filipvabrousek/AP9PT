import Playgrounds

#Playground {
    
    // Swift cod ebegins here
    print("Hello, Playground!")
    
    var data = 23
    
    let pi = 3.14
    
    var price: Double = 18000
    print(price)
    
    print("Price is \(price)")
    print("Price \(price)")
    
    
    if pi > 3 {
        print("Pi is bigger than 3")
    } else {
        
    }
    
    
    let number = 12
    
    switch number {
    case 12: print("12")
    case 11: print("11")
    case 10: print("10")
    default: print("Other")
    }
    
    print(number)
    print("---")
    
    
    func multiply(a: Double, b: Double) -> Double {
        a * b
    }
    
    let res = multiply(a: 3, b: 4)
    print("Result is \(res)")
    
    
    
    class Person {
        var name: String
        init(name: String){
            self.name = name
        }
    }
    
    let pa = Person(name: "Eda")
    print(pa.name)
    
    
    struct Animal {
        var name: String = ""
        
        func sayHi() -> String {
            return "Hello, I am \(name)"
        }
    }
    
    let a = Animal(name: "Cat")
    print(a.sayHi())
    
    
    
    protocol Named {
        var name: String { get set }
    }
    
    
    struct AnotherP: Named {
        var name: String = ""
    }
    
    let another = AnotherP(name: "Karsel")
    
    print(another.name)
    
    
    func getNamed() -> some Named {
        return another
    }
    
    let r = getNamed()
    print(r.name)
    
    // https://github.com/filipvabrousek/AP9PT
    
    
    
    
    
    
    
    
    
    
    
}
