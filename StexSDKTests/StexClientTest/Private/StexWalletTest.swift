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
    
    func testCreateWallet() {
        let expectation = self.expectation(description: "Testing creating wallet API")
        
        let pairId = 10
        var walletAddress: String?
        
        stexClient.createWallet(with: pairId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                walletAddress = data.depositAddress?.address
                
                print("Success !!! \nData: ", data.depositAddress?.address ?? "Addres not creating")
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(walletAddress != "")
    }
    
    func testFetchWalletAddress() {
        let expectation = self.expectation(description: "Testing wallet address API")
        
        let expectedWalletId = 2291837
        var walletAddress: String?
        
        stexClient.fetchWalletAddress(with: expectedWalletId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                walletAddress = data.address
                
                print("Success !!! \nData: ", data.address ?? "Addres not creating")
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(walletAddress != "")
    }
    
    func testCreateWalletAddress() {
        let expectation = self.expectation(description: "Testing creating wallet address API")
        
        let expectedWalletId = 2291837
        var walletAddress: String?
        
        stexClient.createWalletAddress(with: expectedWalletId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                walletAddress = data.address
                
                print("Success !!! \nData: ", data.address ?? "Addres not creating")
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(walletAddress != "")
    }
}
