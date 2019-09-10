//
//  StexWalletTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexWalletTest: StexPrivateClientTest {
    
    func testWalletList() {
        let expectation = self.expectation(description: "Testing wallet list API")
        
        var walletCount = 0
        
        stexClient.fetchWalletsList() { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                walletCount = data.count
                
                print("Success !!! \nData: ", data.compactMap { $0.id })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(walletCount != 0)
    }
    
    func testWallet() {
        let expectation = self.expectation(description: "Testing wallet API")
        
        let expectedWalletId = 2291837
        var walletId: Int? = 0
        
        stexClient.fetchWallet(with: expectedWalletId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                walletId = data.id
                
                print("Success !!! \nData: ", data.balance)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(walletId == expectedWalletId)
    }
}
