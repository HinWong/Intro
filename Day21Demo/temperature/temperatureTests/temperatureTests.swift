//
//  temperatureTests.swift
//  temperatureTests
//
//  Created by Luat on 2/8/21.
//

import XCTest
@testable import temperature

class temperatureTests: XCTestCase {

    var sut: TempDetailsVM?
    
    override func setUpWithError() throws {
        sut = TempDetailsVM(temp: 99.9, scale: TempScale.farenheit)
        
    }
    
    func testHasData() {
        XCTAssertNotNil(sut?.temp)
        XCTAssertNotNil(sut?.scale)
    }
    
    func testFormatText() {
        let formatedString = sut?.formatText()
        var containsTemp = false
        if let temp = sut?.temp {
            if let contains = formatedString?.contains(String(temp)) {
                containsTemp = contains
            }
        }
        var containsScale = false
        if let scale = sut?.scale {
            if let contains = formatedString?.contains(scale.rawValue) {
                containsScale = contains
            }
        }
        XCTAssert(containsTemp)
        XCTAssert(containsScale)
    }


}
