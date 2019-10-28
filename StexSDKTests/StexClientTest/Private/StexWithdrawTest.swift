//
//  StexWithdrawTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexWithdrawTest: StexPrivateClientTest {
    
    func testCreateWithdrawal() {
        let expectation = self.expectation(description: "Testing create withdraw API")
        
        let address = "SbKhPeP85g8QZSHiuAfwj7a3zoMketT8Vs"
        let amount: Double = 10
        let currencyId = 10
        
        var withdrawalId = 0
        
        stexClient.createWithdraw(with: currencyId, amount: amount, address: address, protocolId: nil, additionalParameter: nil) { result in
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
        
        XCTAssertTrue(withdrawalId != 0)
    }
    
    func testCancelWithdrawal() {
        let expectation = self.expectation(description: "Testing cancel withdraw API")
        
        let withdrawalId = 1150137
        
        var responce: Bool = false
        
        stexClient.cancelWithdraw(with: withdrawalId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                responce = data.id == withdrawalId
                
                print("Success !!! \nData: ", data.id)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(responce)
    }
}
