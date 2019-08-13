//
//  StexCurrencyPairsTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexCurrencyPairsTest: StexClientTest {
    
    func testAllCyrrencyPairsList() {
        let expectation = self.expectation(description: "Testing CyrrencyPairs API")
        
        var cyrrencyPairsCount: Int = 0
        
        stexClient.fetchCurrencyPairsList { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                cyrrencyPairsCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.symbol })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(cyrrencyPairsCount != 0)
    }
    
    func testBTCCyrrencyPairsList() {
        let expectation = self.expectation(description: "Testing CyrrencyPairs API")
        
        let code = "BTC"
        var cyrrencyPairsCount: Int = 0
        
        stexClient.fetchCurrencyPairsList(with: code) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                cyrrencyPairsCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.symbol })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(cyrrencyPairsCount != 0)
    }
    
    func testAllCyrrencyPairsGroup() {
        let expectation = self.expectation(description: "Testing CyrrencyPairs API")
        
        let groupId = 1
        var cyrrencyPairsCount: Int = 0
        
        stexClient.fetchCurrencyPairs(with: groupId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                cyrrencyPairsCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.symbol })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(cyrrencyPairsCount != 0)
    }
    
    func testBTCCurrencyPair() {
        let expectation = self.expectation(description: "Testing CyrrencyPairs API")
        
        let expectedCurrencyName = "Bitcoin"
        let currencyPairId = 207
        
        var resultCurrencyName: String = ""
        
        
        stexClient.fetchCurrencyPair(with: currencyPairId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                resultCurrencyName = data.currencyName
                print("Success !!! \nData: ", data.currencyName)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(expectedCurrencyName == resultCurrencyName)
    }
}
