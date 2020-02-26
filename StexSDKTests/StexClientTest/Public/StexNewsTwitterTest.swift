//
//  StexNewsTwitterTest.swift
//  StexSDKTests
//
//  Created by Hanna Karnaukh on 26.02.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import XCTest

class StexNewsTwitterTest: StexClientTest {

    func testAllNewsTwitter() {
        let expectation = self.expectation(description: "Testing News Twitter API")

        var newsTwitterCount = 0

        stexClient.fetchNewsTwitter { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                newsTwitterCount = data.count
                print("Success !!! \nData: ", data.compactMap { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }

        waitForExpectations(timeout: timeout, handler: nil)
        XCTAssertTrue(newsTwitterCount != 0)
    }
}
