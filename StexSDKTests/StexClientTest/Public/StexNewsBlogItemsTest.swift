//
//  StexNewsBlogItemsTest.swift
//  StexSDKTests
//
//  Created by Hanna Karnaukh on 10.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import XCTest

class StexNewsBlogItemsTest: StexClientTest {
    
    func testBlogItems() {
        let expectation = self.expectation(description:  "Testing News Blog API")
        
        var newsBlogItemsCount = 0
        
        stexClient.fetchNewsBlog { result in
            switch result {
            case .success(let blogItems):
                expectation.fulfill()
                newsBlogItemsCount = blogItems.items.count
                print("Success !!! \nData: ", blogItems.items.compactMap { $0.title })
                
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
    
        waitForExpectations(ti meout: timeout, handler: nil)
        XCTAssertTrue(newsBlogItemsCount != 0)
    }
}
