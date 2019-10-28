//
//  StexChartTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 8/7/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexChartTest: StexClientTest {
    
    func testBTC_ETHchart() {
        let expectation = self.expectation(description: "Testing Chart API")
        
        var candleCount: Int = 0
        
        stexClient.fetchChartData(with: 2, candlesType: .oneMinute, timeStart: 1565160000, timeEnd: 1565168981) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                candleCount = data.count
                
                print("Success !!! \nData: ", data.compactMap { $0.high })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(candleCount != 0)
    }
}
