//
//  StexFeeTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexFeeTest: StexPrivateClientTest {
    
    func testFee() {
        let expectation = self.expectation(description: "Testing fee API")
        
        var sellFee: Double = 0
        
        stexClient.fetchFee(for: 1) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                sellFee = data.sellFee
                
                print("Success !!! \nData: ", data.sellFee, data.sellFee)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(sellFee != 0)
    }
}
