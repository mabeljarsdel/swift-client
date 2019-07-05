//
//  StexClientTest.swift
//  STEX APITests
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest
import StexSDK

@testable import StexSDK

class StexClientTest: XCTestCase {
    
    var stexClient: StexClient!
    let timeout: Double = 3
    
    override func setUp() {
        super.setUp()
        
        stexClient = StexClient()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
