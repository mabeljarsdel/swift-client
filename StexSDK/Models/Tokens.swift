//
//  Tokens.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

class Tokens: Codable {
    var tokenType: String
    var accessToken: String
    var refreshToken: String
    var expiresAt: Double
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresAt = "expires_at"
    }
}
