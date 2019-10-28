//
//  StexApproxBalance.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 28.10.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexApproxBalance: Codable {
    
    /// Available balance in given currency
    public var balance: Double
    
    /// Amount of coins frozen in orders
    public var frozenBalance: Double
    
    /// Bonus (e.g. for affiliate program) balance
    public var bonusBalance: Double
    
    public var totalBalance: Double
    
    enum CodingKeys: String, CodingKey {
        case balance
        case frozenBalance = "frozen_balance"
        case bonusBalance = "bonus_balance"
        case totalBalance = "total_balance"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        balance = try container.decodeStringToDouble(.balance) ?? 0
        frozenBalance = try container.decodeStringToDouble(.frozenBalance) ?? 0
        bonusBalance = try container.decodeStringToDouble(.bonusBalance) ?? 0
        totalBalance = try container.decodeStringToDouble(.totalBalance) ?? 0
    }
}
