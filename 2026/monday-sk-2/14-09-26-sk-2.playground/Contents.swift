/*print("Hello")

var name = "Eda"
var nname: String = "Karel"

print(name)
print(nname)


let count = 12

if count > 10 {
    print("Bigger than 10")
} else {
    
}


let arr = [1, 2, 3]

for element in arr {
    print(element)
}

for i in arr.enumerated() {
    print("Number \(arr[i.offset])")
}

// loops
/*
let value = 30.0

switch value {
    case 20.0: print("twenty")
    case 30.0: print("thirty")
    case 50.0: print("fifty")
    default: print("N/A")
}
*/

var value = 3.0
value = 2.0

switch value {
  case 1.0: print("One")
  case 2.0: print("Two")
  case 3.0: print("Three")
  default: print("Other")
}


func mult(a: Double, b: Double) -> Double {
    return a * b
}

let res = mult(a: 3, b: 2)
print(res)


// classes and structs


class Person {
    var name = ""
    init(name: String){
        self.name = name
    }
}

let p = Person(name: "Filip")
print(p.name)


struct Point {
    var x: Int
    var y: Int
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
}


let pt = Point(x: 10, y: 20)
print(pt.x)

// protocol
*/
protocol Named {
    var name: String { get set }
}

struct NPerson: Named {
    var name: String = ""
    init(name: String){
        self.name = name    
    }
}

let np = NPerson(name: "A")
print(np.name)

func getNamed() -> some Named {
    return np
}

let aq = getNamed()


/*
func getNamed() -> some Named {
    return np
}

let resn = getNamed()

print("Name is \(resn.name)")
 
 */






