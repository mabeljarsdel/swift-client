//
//  StexTransactionStatusTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 28.10.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexTransactionStatusTest: StexClientTest {
    
    func testAllDepositStatuses() {
        let expectation = self.expectation(description: "Testing Deposoit statuses API")
        
        var statusesCount: Int?
        
        stexClient.fetchDepositStatuses { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                statusesCount = data.count
                
                print("Success !!! \nData: ", data.compactMap { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(statusesCount != nil)
    }
    
    func testAllWithdrawalStatuses() {
        let expectation = self.expectation(description: "Testing Withdrawal statuses API")
        
        var statusesCount: Int?
        
        stexClient.fetchWithdrawalStatuses { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                statusesCount = data.count
                
                print("Success !!! \nData: ", data.compactMap { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(statusesCount != nil)
    }
}

