//
//  StexBalanceChanged.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexBalanceChanged: Codable {
    
    /// Wallet id
    public var id: Int
    
    /// Available balance
    public var balance: Double
    
    /// Bonus balance
    public var bonusBalance: Double
    
    /// Currency code
    public var currencyCode: String
    
    /// Frozen balance
    public var frozenBalance: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case balance
        case bonusBalance = "bonus_balance"
        case currencyCode = "currency_code"
        case frozenBalance = "frozen_balance"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        currencyCode = try container.decode(String.self, forKey: .currencyCode)
        
        balance = try container.decodeStringToDouble(.balance)
        bonusBalance = try container.decodeStringToDouble(.bonusBalance)
        frozenBalance = try container.decodeStringToDouble(.frozenBalance)
    }
}
