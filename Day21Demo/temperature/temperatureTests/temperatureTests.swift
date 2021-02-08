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
        sut?.resourceString = "https://www.google.com"
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
    
    func testDecode() {
        var decodedModel: [Profile]?
        
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "mockData", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                decodedModel = try? JSONDecoder().decode([Profile].self, from: jsonData)
            }
        }
        let count = decodedModel?.count
        XCTAssertEqual(count, 2, "Decoded profiles count is \(count) should have count of 2")
        XCTAssertEqual(decodedModel?.first?.name, "Name test 1")
    }
    
    func testStatusCode() {
        let resourceStr = sut?.resourceString ?? ""
        guard let url = URL(string: resourceStr) else { return }
        var statusCode: Int?
        
        let promise = expectation(description: "HTTP response Status code is 200")
        URLSession.shared.dataTask(with: url) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            promise.fulfill()
        }.resume()
        
        wait(for: [promise], timeout: 5)
        XCTAssertEqual(statusCode, 200)
    }

    func testGetData() {
        let promise = expectation(description: "temp will be 50")
        var fetchedData = 0.0
        sut?.getData(completion: { (data) in
            fetchedData = data
            promise.fulfill()
        })
        
        wait(for: [promise], timeout: 4)
        XCTAssert(fetchedData == 50, "Temp \(fetchedData) should be 50")
        XCTAssertNotNil(fetchedData, "Fetched data should not be nil")
    }

}
