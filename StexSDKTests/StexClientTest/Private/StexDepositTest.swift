//
//  StexDepositTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexDepositTest: StexPrivateClientTest {
    
    func testFetchDepositList() {
        let expectation = self.expectation(description: "Testing deposit list API")
        
        var depositsCount = 0
        
        stexClient.fetchDepositsList() { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                depositsCount = data.count
                
                print("Success !!! \nData: ", data.compactMap { $0.id })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(depositsCount != 0)
    }
    
    func testFetchDeposit() {
        let expectation = self.expectation(description: "Testing deposit API")
        
        let expectedDepositId = 7757394
        var depositId = 0
        
        stexClient.fetchDeposit(with: expectedDepositId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                depositId = data.id
                
                print("Success !!! \nData: ", data.id)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(depositId == expectedDepositId)
    }
}
