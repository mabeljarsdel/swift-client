//
//  StexProfileInfoTest.swift
//  StexSDKTests
//
//  Created by Alexander Rudyk on 8/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexProfileInfoTest: StexPrivateClientTest {
    
    func testProfileInfo() {
        let expectation = self.expectation(description: "Testing profile info API")
        
        var email: String = ""
        
        stexClient.fetchProfileInfo { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                email = data.email
                
                print("Success !!! \nData: ", data.email)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(!email.isEmpty)
    }
}
