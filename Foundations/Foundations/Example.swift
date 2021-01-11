//
//  Example.swift
//  Foundations
//
//  Created by Luat on 1/10/21.
//

import Foundation

class Example {
    
    func sum(num1: Int, num2: Int) -> Int {
        return 0
    }
    
    func isPrime(num: Int) -> Bool {

        return false
    }
    
    func splitSentenceIntoArray(sentence: String) -> [String] {
        return []
    }
    
    /// "Hello World Where Is Food" -> "Hello! World! Where! Is! Food!"
    func addExclaimMarkToWords(words: String) -> String {

        return ""
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
