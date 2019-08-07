//
//  StexOrderbookTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexOrderbookTest: StexClientTest {
    
    func testBTC_ETHOrderbook() {
        let expectation = self.expectation(description: "Testing Orderbook API")
        
        var askCount: Int = 0
        var bidCount: Int = 0
        
        stexClient.fetchOrderbook(with: 2) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                askCount = data.ask.count
                bidCount = data.bid.count
                
                print("Success !!! \nData: ", data.ask.compactMap { $0.price })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(askCount != 0 && bidCount != 0)
    }
}
