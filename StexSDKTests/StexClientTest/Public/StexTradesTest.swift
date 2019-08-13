//
//  StexTradesTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 8/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexTradesTest: StexClientTest {
    
    func testBTC_ETHTrades() {
        let expectation = self.expectation(description: "Testing Trades API")
        
        var btcTradesCount: Int = 0
        
        stexClient.fetchTrades(with: 2, from: nil, till: nil, offset: nil) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                btcTradesCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.price })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(btcTradesCount != 0)
    }
}
