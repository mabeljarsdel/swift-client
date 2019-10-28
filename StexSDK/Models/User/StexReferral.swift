//
//  StexReferral.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 28.10.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexReferral: Codable {
    public var referralCode: String
    public var members: Int
    public var invited: Bool
    
    enum CodingKeys: String, CodingKey {
        case referralCode = "referral_code"
        case members
        case invited
    }
}
