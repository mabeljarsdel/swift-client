//
//  StexUser.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexUser: Codable {
    
    /// User email.
    ///
    /// Example: `user@domain.com`
    public var email: String
    
    /// Username.
    ///
    /// Example: `cool_trader_45`
    public var username: String
    
    /// User verifications.
    ///
    /// Example: `"stex": true`
    public var verifications: [String: Bool]
    
    /// User trading fee levels.
    ///
    /// Example: `"not_verified": "0.0005"`
    public var tradingFeeLevels: [String: String]
    
    public var id: Int
    
    public var referralProgram: StexReferral
    
    public var approxBalance: [String: StexApproxBalance]?
    
    public var settings: StexUserSettings?
    
    public var needVerify: Bool?
    
    public var showNoKycTerms: Bool?
    
    enum CodingKeys: String, CodingKey {
        case email
        case username
        case verifications
        case tradingFeeLevels = "trading_fee_levels"
        case id = "user_id"
        case referralProgram = "referral_program"
        case approxBalance = "approx_balance"
        case settings
        case needVerify = "need_verify"
        case showNoKycTerms = "show_no_kyc_terms"
    }
}
