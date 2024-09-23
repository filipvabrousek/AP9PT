print("Hello World")

var amount = 500
print(amount)

let pi = 3.141592
print(pi)

if (pi > 3){
  print("pi is greater than 3")
} else {
  print("pi is less than or equal to 3.")
}

func greet(){
  print("Hello")
}

greet()

func greet(name: String){
  print("Hello \(name)")
}
greet(name: "Tim")

func S(a: Double, b: Double) -> Double {
return a * b // return is not mandatory
}

let result = S(a: 2, b: 3)
print(result)

func circleArea(pi: Double = 3.141592, r: Double) -> Double {
  pi * r * r
}

let resa = circleArea(pi: 3, r: 20)
print(resa)


// Structs

struct Person { //  or class
  var name: String
  init(name: String){
    self.name = name
  }

  func introduce() -> String {
    return "Hello, I am \(self.name)"
  }
}

let p = Person(name: "Eda")
print(p.introduce())

// Optionals

var name: String? = "Filip"
print(name)

name = nil
print(name)

if (name != nil){
  print(name!)
}

if let name = name {
  print(name)
}


//----------
protocol Named {
  var name: String { get set }
}

struct Student: Named {
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

print(getStudent(student: s).name)
