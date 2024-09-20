# Proměnné a konstanty
```
print("Hello World!")

var amount = 500
print(amount)

let pi = 3.141592
print(pi)
```


## Podmínky

```swift
if (pi > 3){
  print("pi is greater than 3.")
} else {
  print("Less than or equal to three.")
}

```


## Funkce

```swift
func greet(){
  print("Hello")
}

greet()

func greet(name: String) {
  print("Hello \(name)")
}

greet(name: "iPhone 16 Pro.")


func S(a: Double, b: Double) -> Double {
  return a * b;
}

let result = S(a: 2, b: 3);
print(result)

```


```swift

// 

func square(_ a: Double) -> Double {
  a * a
}


func squareNameArg(value a: Double) -> Double {
  a * a
}


let resultaa = square(16) // no argument needed
print("Result \(resultaa)")


let resultad = squareNameArg(value: 16) // named argument
print("Result \(resultad)")


// Default argument name
func circleArea(pi: Double = 3.141592, r: Double) -> Double {
  return pi * r * r
}

let res = circleArea(pi: 3, r: 20)
print(res)

let resd = circleArea(r: 20)
print(resd)

```






struct Person { // value type, class
  var name: String
  init(name: String){
    self.name = name
  }

  func introduce() -> String {
    return "Hello \(self.name)"
  }
}

let p = Person(name: "Filip")
print(p.introduce())


protocol Named {
  var name: String { get set }
}

struct Student: Named { // implementuje protokol Named
  var name: String
  init(name: String){
    self.name = name
  }
}

let s = Student(name: "Filip")
print(s.name)

func getStudent(student: Student) -> some Named {
  return student
}

let sa = getStudent(student: s)
print(sa.name)







// Optionals
var name: String? = "Filip" // Optional
// may or may not have value
//name = nil
print(name)
//print(name!)

if name != nil {
  print(name!)
}

if let unwrappedName = name {
  print(unwrappedName)
}

// User(name: String, born: Int?)
// User(name: "Eda", born: nil)

// if born != nil






