import Foundation

// MARK: - EXAMPLES

func iterateWord(word: String) {
    for char in word {
        print(char)
    }
}
//iterateWord(word: "Abcde")

func iterateWithIndex(word: String) {
    let startIndex = word.startIndex
    for index in 0..<word.count {
        let nextIndex = word.index(startIndex, offsetBy: index)
        print(word[nextIndex])
    }
}
//iterateWithIndex(word: "Abcde")

/// A set does not contain duplicates and is in random order
func removeDuplicate(numbers: [Int]) {
    var numberSet = Set<Int>()
    for num in numbers {
        numberSet.insert(num)
    }
    print(numberSet)
}
//removeDuplicate(numbers: [1,1,2,3,3,3,4])


func numberExistsInSet(mySet: Set<Int>, number: Int) -> Bool {
    return mySet.contains(number)
}
let daysOff: Set<Int> = [24, 25, 1, 2, 3]
//print(numberExistsInSet(mySet: daysOff, number: 23))


func personInfo(name: String, location: String) -> [String: String] {
//    let infoDictionary: [String: String] = [:]
    var infoDictionary = [String:String]()
    infoDictionary["name"] = name
    infoDictionary["location"] = location
    return infoDictionary
}
//print(personInfo(name: "Michael", location: "Chicago"))



// MARK: - QUESTIONS

/// 1. Write a function that returns an array of the positions of a character in the word
func positionOf(character: Character, in word: String) -> [Int] {
    
    return []
}
print(positionOf(character: "l", in: "Hello"))  // -> [2, 3]



/// 2. Write a function that takes a string and returns a string without any duplicated letters
/// "hello" -> "helo"




/// 3.  Write a function that returns a dictionary with the (key, value) storing (character, count of character) for a word
/// HELLO -> [H: 1, E: 1, L: 2, O: 1]





/// 4.  Write isPalindrome that returns a boolean





/// 5. Write a funciton that returns the most frequently occurring letter in a string
/// HELLO -> "L"




/// 6.  Write a function that takes an array of Int and returns true if there is any two numbers that sums to 0
/// Use set or dictionary





