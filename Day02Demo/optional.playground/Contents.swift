import UIKit

var str = "Hello, playground"

var nonOptional: Int = 10
var optionalNum: Int? = 9


/// force unwrap
nonOptional = optionalNum!


/// optional binding
print(optionalNum)
if let num = optionalNum {
    nonOptional = num
    print(nonOptional)
}

guard let num = optionalNum else { fatalError() }
print(num)


/// default value
/// nil coalescing
let newNum = optionalNum ?? -1


/// optiona chaining

struct Person {
    var name: String?
}
let noName = Person()
print(noName.name)
let optionalPerson: Person? = Person(name: "Luke")
if let person = optionalPerson {
    if let name = person.name {
        print(name)
    }
}
print(optionalPerson?.name)


/// implicit unwrap
let implicitUnwrap: Int! = 9
let hasValue: Int = implicitUnwrap
print(hasValue)
