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
    
    func testCancelOrders() {
        let expectation = self.expectation(description: "Testing canceling orders API")
        
        var ordersCount = 0
        
        stexClient.cancelOrders { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                ordersCount = data.putIntoProcessingQueue.count
                
                print("Success !!! \nData: ", data.message ?? "")
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(ordersCount != 0)
    }
    
    func testCreateOrders() {
        let expectation = self.expectation(description: "Testing creating orders API")
        
        let pairId = 621
        let type = OrderType.sell
        let amount: Double = 0.1
        let price: Double = 0.00001
        
        var orderId = 0
        
        stexClient.createOrder(with: pairId, type: type, amount: amount, price: price, triggerPrice: nil) { result in
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
        
        XCTAssertTrue(orderId != 0)
    }
    
    func testFetchOrder() {
        let expectation = self.expectation(description: "Testing fetching order API")
        
        let expectedOrderId = 119149298
        var orderId = 0
        
        stexClient.fetchOrder(with: expectedOrderId) { result in
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
    
    func testCancelOrder() {
        let expectation = self.expectation(description: "Testing canceling order API")
        
        let expectedOrderId = 119149298
        var ordersCount = 0
        
        stexClient.cancelOrder(with: expectedOrderId) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                ordersCount = data.putIntoProcessingQueue.count
                
                print("Success !!! \nData: ", data.message ?? "")
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(ordersCount != 0)
    }
}
