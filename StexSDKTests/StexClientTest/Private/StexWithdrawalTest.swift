//
//  StexWithdrawalTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexWithdrawalTest: StexPrivateClientTest {
    
    func testFetchWithdrawalList() {
        let expectation = self.expectation(description: "Testing withdrawal list API")
        
        var withdrawalCount = 0
        
        stexClient.fetchWithdrawalsList() { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                withdrawalCount = data.count
                
                print("Success !!! \nData: ", data.compactMap { $0.id })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(withdrawalCount != 0)
    }
    
    func testFetchWithdrawal() {
        let expectation = self.expectation(description: "Testing withdrawal API")
        
        let expectedWithdrawalId = 497122
        var withdrawalId = 0
        
        stexClient.fetchWithdrawal(with: expectedWithdrawalId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                withdrawalId = data.id
                
                print("Success !!! \nData: ", data.id)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(withdrawalId == expectedWithdrawalId)
    }
}
