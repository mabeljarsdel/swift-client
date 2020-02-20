//
//  StexPrivateClientTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexPrivateClientTest: StexClientTest {
    
    override func setUp() {
        StexTokensManager.shared.setTokens(accessToken: "your_access_token", refreshToken: "your_refresh_token")
        
        super.setUp()
        
        timeout = 5
    }
}
