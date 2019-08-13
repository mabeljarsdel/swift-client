//
//  StexCurrenciesTest.swift
//  STEX APITests
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexCurrenciesTest: StexClientTest {
    
    func testAllCurrencies() {
        let expectation = self.expectation(description: "Testing Currencies API")
        
        var currenciesCount: Int = 0
        
        stexClient.fetchAllCurrencies { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                currenciesCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(currenciesCount != 0)
    }
    
    func testSingleCurrency() {
        let expectation = self.expectation(description: "Testing Currencies API")
        
        let expectedCurrencyName = "Bitcoin"
        let currencyId = 1
        
        var resultCurrencyName: String = ""
        
        stexClient.fetchCurrency(with: currencyId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                resultCurrencyName = data.name
                print("Success !!! \nData: ", data.name)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(expectedCurrencyName == resultCurrencyName)
    }
}
