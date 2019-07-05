//
//  StexTickerTest.swift
//  STEX APITests
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexTickerTest: StexClientTest {
    
    func testAllTicker() {
        let expectation = self.expectation(description: "Testing Tiker API")
        
        var tickersCount: Int = 0
        
        stexClient.fetchAllTicker { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                tickersCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.symbol })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(tickersCount != 0)
    }
    
    func testSingleTicker() {
        let expectation = self.expectation(description: "Testing Tiker API")
        
        let expectedPairName = "ETH_BTC"
        let pairId = 2
        
        var resultPairName: String = ""
        
        stexClient.fetchTicker(with: pairId) { result in
            switch result {
            case .success(let data):
                print("Success !!! \nPair Name: ", data.symbol)
                
                resultPairName = data.symbol
                
                expectation.fulfill()
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        
        XCTAssertTrue(resultPairName == expectedPairName)
    }
}
