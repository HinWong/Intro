//
//  Example.swift
//  Foundations
//
//  Created by Luat on 1/10/21.
//

import Foundation

class Example {
    /// TDD: test driven development
    /// RED- GREEN- REFACTOR
    /// write tests first, have them fail
    /// write code, have tests pass
    /// refactor
    /// test coverage: high
    /// Unit test: test singular functionalities
    func sum(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    func isPrime(num: Int) -> Bool {

        return true
    }
    
    func splitSentenceIntoArray(sentence: String) -> [String] {
        return []
    }
    
    /// "Hello World Where Is Food" -> "Hello! World! Where! Is! Food!"
    func addExclaimMarkToWords(words: String) -> String {

        return ""
    }
    
    /// use string index
    func isPalindrome(word: String) -> Bool {
        
        return false
    }
    
    /// "cat" -> ["ac", "ca", "at", "ta", "tc", "ct"]
    func twoLetterCombos(word: String) -> Set<String> {
        
        return []
    }
    
    /// replace all occurences of "food" to be "$$$"
    func replaceFoodSubstring(words: String) -> String {
        return ""
    }
    
    /// ["Adam", "Alison", "Ben"] -> ["Adam", "Alison"] when startingLetter is "A"
    func selectNames(names: [String], startingLetter: String) -> [String] {
        return []
    }
    
    /// "abc xyz", 1 -> "bcd yza"
    func shiftStringUpByOffset(string: String, offSet: Int) -> String {
        /// Creating an english alphabet array
        let aScalars = "a".unicodeScalars
        let unicodeNumber = aScalars[aScalars.startIndex].value // 97
        let alphabet: [Character] = (0..<26).map { i in
            return Character(UnicodeScalar(unicodeNumber + i)!)
        }
        
        
        return ""
    }
    
}
