print("Good morning!")

var test = 100
test = 200
print(test)

let pi = 3.141592
print(pi)

if (pi > 3.1){
    print("pi is greater than 3.1")
} else if (pi > 3){
    print("pi is greater than 3")
}
else {
    print("pi is less than 3")
}


func square(a: Double) -> Double {
    return a * a
}

let s = square(a: 23)
print(s)

func S(a: Double, b: Double) -> Double {
    a * b
}

// rectangle area
let area = S(a: 3, b: 4) 
print(area)


func SSimple(_ a: Double, _ b: Double) -> Double {
    a * b
}

let sa = SSimple(3, 4)
print(sa)


let a = 3
let b = 6
print("Area of rectangle with sides a = \(a) and b = \(b) is \(a * b)")

let tuple: (name: String, age: Int) = ("Filip", 25)
print(tuple.0)
print(tuple.1)

func getTuple() -> (String, Int){
    return ("Filip", 25)
}

let resTuple = getTuple()
print(resTuple)

let (justName, _) = resTuple
print("Just name \(justName)")


// ------------------------------------------
var name: String? // may or may not have value
name = "Eda"
print(name)

// print(name!)

if name != nil {
    print(name!)
}

if let namea = name /*this is the var we reffer to*/ {
    print(namea)
}


var optionalVal = Optional(16)
//print(optionalVal)
//print(optionalVal!)
optionalVal = nil
// 2 blocks remaining

print("Some code")
// Assertion failed: Cannot be nil
// assert(optionalVal != nil, "Cannot be nil")
print("Won't get there")
// assert


enum State {
    case happy
    case sad
    case okay
}

let myMood: State = .happy
print(myMood)

if myMood == .happy {
    print("Everything is great!")
}

// Unicode chars
let heart = "\u{2764}"
print(heart)

// in-out params
func swap(a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

var aVal = 3
var bVal = 7

let swapped = swap(&aVal, &bVal)
print(aVal)


// try catch
enum LoginError: Error {
    case empty
}

struct Username {
    let name: String 
    init(name: String) throws {
        if name.isEmpty {
            throw LoginError.empty
        }
        
        self.name = name
    }
}

// try! Username(name: "")

do {
    try Username(name: "")
    print("User created")
} catch LoginError.empty {
    print("The username cannot be empty")
}

// Optional chanining
class Person {
    var amount: Money?
}

class Money {
    var value = 2000
}

let me = Person()
me.amount = Money()

if let money = me.amount?.value {
    print("I have \(money) USD")
}

// Revise
var array = [1, 2, 3]
print(array.count)

array.append(3)
print(array)

print(array.first!)
print(array.last!)

array.removeLast(1)

print(array)



// Class with method

protocol RequiresID { // C# interface
    var id: String {get set}
}
// myView: View
class Student: RequiresID { // reference type, struct is value type
    var name: String
    var id: String
    
    init(name: String, id: String){
        self.name = name
        self.id = id
    }
    
    func getInfo() -> String {
        return "Student's id is \(self.id)"
    }
}

let myTest = Student(name: "Filip", 
                    id: "IOHIUOG897T")
let res = myTest.getInfo()
print(res)

// var body: some View
// get any class or struct that implements requires ID
func getStudent() -> some RequiresID /*& requiresSomethign Else*/ {
    return Student(name: "Filip", 
                    id: "POIHOIHIO907986")
}

let mee = getStudent()
print(mee.id)

func getMe(student: RequiresID){
print("Helloa")
    print(student)
}

getMe(student: mee)
//10:15


let str = "Hello"

extension String {
    func up() -> String {
        self.uppercased()
    }
}

let raa = str.up() // HELLO
print(raa)


