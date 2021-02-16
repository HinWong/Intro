import Foundation

class Person {
    let name: String
    var age: String
    var ageInt: Int {
        get {
            if let ageInt = Int(age) {
                return ageInt
            } else {
                return 0
            }
        }
        set {
            age = String(newValue)
        }
    }

    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
    
    func grow() {
        ageInt += 1
    }
}
let personClass = Person(name: "asdf", age: "123")
let personClassTwo = personClass
//personClass = Person(name: "asdffe", age: "23")
//let currentAge = personClass.age
print("current age \(personClass.age)")
personClass.grow()
print("new age \(personClass.age)")
personClass.grow()
print("new age after pTwo grows \(personClassTwo.age)")

struct PersonStruct {
    let name: String
    var age: String
    var ageInt: Int {
        get {
            if let ageInt = Int(age) {
                return ageInt
            } else {
                return 0
            }
        }
        set {
            age = String(newValue)
        }
    }
    mutating func grow() {
        ageInt += 1
    }
}

var personStruct = PersonStruct(name: "tom", age: "50")
var personStructTwo = personStruct
personStruct.grow()
personStruct.grow()
print("struct age \(personStruct.age)")
print("structTwo age \(personStructTwo.age)")
