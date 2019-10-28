//
//  StexTokensManager.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Locksmith

public class StexTokensManager {
    
    public static let sharded = StexTokensManager()
    
    internal var accessToken: String?
    internal var refreshToken: String?
    
    init() {
        accessToken = Locksmith.loadDataForUserAccount(userAccount: Token.tokens)?[Token.accessToken] as? String
        refreshToken = Locksmith.loadDataForUserAccount(userAccount: Token.tokens)?[Token.refreshToken] as? String
    }
    
    /// Set up your tokens for autorized request
    public func setTokens(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        
        saveTokens(accessToken: accessToken, refreshToken: refreshToken)
    }
    
    /// Set up your Server-To-Server token for autorized request
    public func setS2SToken(s2sToken: String) {
        self.accessToken = s2sToken
        self.refreshToken = ""
        
        saveTokens(accessToken: s2sToken, refreshToken: "")
    }
    
    //MARK: - Private
    
    private struct Token {
        static let tokens = "tokens"
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
    }
    
    private func saveTokens(accessToken: String, refreshToken: String) {
        let tokens = [Token.accessToken: accessToken, Token.refreshToken: refreshToken]
        
        do {
            try Locksmith.updateData(data: tokens, forUserAccount: Token.tokens)
        }  catch let error {
            NSLog(error.localizedDescription)
        }
    }
}
