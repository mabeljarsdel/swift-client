//
//  StexTradingHistoryTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexTradingHistoryTest: StexPrivateClientTest {
    
    func testTradingHistoryList() {
        let expectation = self.expectation(description: "Testing trading history list API")
        
        var ordersCount = 0
        
        stexClient.fetchTradingHistory(orderStatus: .finished) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                ordersCount = data.count
                
                print("Success !!! \nData: ", data.map { $0.id })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(ordersCount != 0)
    }
    
    func testTradingHistoryOrder() {
        let expectation = self.expectation(description: "Testing trading history order API")
        
        let expectedOrderId = 105890062
        var orderId = 0
        
        stexClient.fetchTradingHistory(with: expectedOrderId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                orderId = data.id
                
                print("Success !!! \nData: ", data.id)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(expectedOrderId == orderId)
    }
}
