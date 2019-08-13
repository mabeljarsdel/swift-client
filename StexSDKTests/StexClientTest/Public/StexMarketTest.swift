//
//  StexMarketTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexMarketTest: StexClientTest {
    
    func testAllMarkets() {
        let expectation = self.expectation(description: "Testing Markets API")
        
        var marketsCount: Int = 0
        
        stexClient.fetchAllMarkets { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                marketsCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(marketsCount != 0)
    }
}
