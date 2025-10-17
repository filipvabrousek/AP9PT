print("Hello AK9PT!")

// comment
/*
Multiline comment
 
 */

print("Test")


print("Hello World")

var value = 12
print(value)

let pi = 3.141592
// pi = 3 => error

if (value > 12){
  print("Bigger than 12")
} else {
  print("Less than equal to 12")
}
// switch also

// C# Double value = 3.0

var doubleValue: Double = 3.0
var double = 3.14

var empty: Double? = nil
print(double)


func S(a: Double, b: Double) -> Double {
   a * b
}

let res = S(a: 3, b: 2)
print(res)


func upperCase(_ str: String) -> String {
    str.uppercased()
}

upperCase("Hello")


struct Person { // class
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func greet() -> String {
        "Hello \(self.name)!!!"
    }
    
    
    func load(completion: @escaping (String) -> Void
    ) {
        // async url request
        // or async await
        completion("Filip")
       // print("Loading...")
    }
}

let p = Person(name: "Filip", age: 26)
print(p)
print(p.age)
p.greet()

p.load { str in
    print("Completing")
    print(str)
}



// protocols


protocol Aged {
    var age: Int { get set }
}

class AgedPerson: Aged {
    var name: String = ""
    var age: Int = -1
}

let ag = AgedPerson()
ag.age = 26
print(ag.age)


// allow return all classes or struct that implement protocol Aged

@MainActor
func returnClassesImplementingAged() -> some Aged {
    ag
}

returnClassesImplementingAged()






