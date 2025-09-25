print("Hello world")

var value = 23 // Int
var someStr = "School" // String
var pi = 3.141592 // Float/Double

var name = "Eda"
print("Your name is \(name)")
// zpětné lomítko - klávesa globus a závorky

let e: Double = 2.7
print(e)



if value > 20 {
    print("Value is bigger than 20")
} else {
    print("Less than 20")
} // else if



class User { // struct
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

let eda = User(
    name: "Eda",
    age: 32
)

print(eda.name)


func multiply(a: Double) -> Double {
    a * a
}

multiply(a: 3)



protocol Aged {
    var age: Int {get set}
}


struct AgedUser: Aged {
    var age: Int = -1
}

let aged = AgedUser(age: 23)
print(aged.age)

// return any class or struct that implements protocol Aged
func getUser() -> some Aged {
    aged
}

