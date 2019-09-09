//
//  StexOrdersTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexOrdersTest: StexPrivateClientTest {
    
    func testOrdersList() {
        let expectation = self.expectation(description: "Testing orders list API")
        
        var ordersCount = 0
        
        stexClient.fetchOrdersList { result in
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
}
