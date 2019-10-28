//
//  StexPairsGroupsTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexPairsGroupsTest: StexClientTest {
    
    func testAllPairsGroups() {
        let expectation = self.expectation(description: "Testing PairsGroups API")
        
        var groupsCount: Int = 0
        
        stexClient.fetchAllPairsGroups { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                groupsCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(groupsCount != 0)
    }
}
