import UIKit

var str = "Hello, playground"

var myStr = "hello world"


func addString(original: String) -> String {
    return original + "there"
}

var tuple = ("hello", 4)
tuple.0
tuple.1
var (greeting, number) = tuple
greeting
number
let myNamedTuple: (myGreeting: String, myNum: Int,time: Date) = ("greetings", 5, Date())
myNamedTuple.myGreeting

//print(myStr[1])

let startingIndex = myStr.startIndex
//print(myStr[myStr.startIndex])

let nextIndex: String.Index = myStr.index(after: startingIndex)
myStr[nextIndex]

let secondIndex = myStr.index(startingIndex, offsetBy: 1)
//print(secondIndex)
myStr.split(separator: " ")
myStr.replacingOccurrences(of: " ", with: "! ")
myStr + "!!"

let char: Character = "o"

let num = 1
let numtwo: Double = 2

myStr.count

myStr.hasPrefix("hello")

myStr.replaceSubrange(startingIndex...secondIndex, with: "HE")
//print(myStr.firstIndex(of: "w")!)

let streetName = "123 Fake st"
//print(streetName.prefix(while: { "0"..."9" ~= $0 }))
var stringArray: [String] = ["1", "2", "3"]
var intArray = [1,2,3]
var anyArray: [Any] = [1, "2", stringArray]
anyArray.append(3)

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let luke = Person(name: "Luke", age: 32)
var people: [Person] = [luke]
people.append(Person(name: "Bob", age: 30))
people[1]

var peopleDictionary: [String: Int] = [

    "Luke": 32,
    "Tom": 21,
    "Kelly": 34
]
var peopleDictionaryTwo: Dictionary<String, Int> = ["Luke": 32]

let possibleAge = peopleDictionary["Bob"] // nil
//print(possibleAge)
let optionalIntArray: [Int?] = [possibleAge]
let nonOptionalIntArray: [Int] = [possibleAge ?? 0]
let ageArray = peopleDictionary.values
//print("values", ageArray)

let myAgeArray = [32,54,21]
myAgeArray.count
myAgeArray[2]
myAgeArray.filter { (num) -> Bool in return num < 40 }
myAgeArray.filter { (num) in return num < 40 }
myAgeArray.filter { (num) in num < 40 }
print(myAgeArray.filter { $0 < 40 })

func filterLessThan(num: Int) -> Bool {
    return num < 40
}

myAgeArray.map { num -> Int in
    return num * 2
}
print(myAgeArray.map({$0*2}))

print(myAgeArray.reduce(0, {$0 - $1}))

