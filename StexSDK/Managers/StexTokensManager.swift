//
//  StexTokensManager.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

public class StexTokensManager {
    
    public static let sharded = StexTokensManager()
    
    internal var accessToken: String?
    internal var refreshToken: String?
    
    public func setTokens(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
