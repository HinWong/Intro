//
//  FoundationsTests.swift
//  FoundationsTests
//
//  Created by Luat on 1/10/21.
//

import XCTest
@testable import Foundations

class FoundationsTests: XCTestCase {

    let tester = Example()
    let testString = "Hello World where is food"
    
    func testSum() {
        let testSum = tester.sum(num1: 3, num2: 3)
        XCTAssertEqual(testSum, 6, "Sum of num1 = 3 and num2 = 3 should equal 6")
    }
    
    func testIsPrime() {
        let isPrimeTestValue = tester.isPrime(num: 13)
        XCTAssert(isPrimeTestValue == false, "isPrime(13) should return false")
    }
    
    func testSplit() {
        let results = tester.splitSentenceIntoArray(sentence: "Hello World where is food")
        let answer = [
            "Hello",
            "World",
            "where",
            "is",
            "food",
        ]
        for word in answer {
            XCTAssert(results.contains(word), "\(results) does not contain \"\(word)\"")
        }
    }

    func testExclaim() {
        let result = tester.addExclaimMarkToWords(words: testString)
        XCTAssert(result == "Hello! World! where! is! food!")
    }
    
    func testCombo() {
        let results = tester.twoLetterCombos(word: "cat")
        XCTAssert(results.contains("ca"), "\(results) does not contain \"ca\"")
        XCTAssert(results.contains("ct"), "\(results) does not contain \"ct\"")
        XCTAssert(results.contains("at"), "\(results) does not contain \"at\"")
        XCTAssert(results.contains("ac"), "\(results) does not contain \"ac\"")
        XCTAssert(results.contains("ta"), "\(results) does not contain \"ta\"")
        XCTAssert(results.contains("tc"), "\(results) does not contain \"tc\"")
    }
    
    func testReplace() {
        let result = tester.replaceFoodSubstring(words: testString)
        XCTAssertTrue(result == "Hello World where is $$$", "\"\(testString)\" is not the same as \"\(result)\"")
    }
    
    func testSelect() {
        let result = tester.selectNames(names: ["Adam", "Alison", "Ben"], startingLetter: "A")
        XCTAssert(result == ["Adam", "Alison"], "\"\(result)\" is not the same as [\"Adam\", \"Alison\"]")
    }
    
    func testShift() {
        let result = tester.shiftStringUpByOffset(string: "abc xyz", offSet: 1)
        XCTAssert(result == "bcd yza")
    }
}
