//
//  StexUserOrder.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexUserOrder: Codable {
    
    /// Order ID
    public var id: Int
    
    /// User ID
    public var userId: Int
    
    /// Currency pair ID
    public var pairId: Int
    
    /// Available order amount
    public var amount: Double
    
    /// Order price
    public var price: Double
    
    /// Amount in market currency
    public var amount2: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case pairId = "currency_pair_id"
        case amount
        case price
        case amount2
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        userId = try container.decode(Int.self, forKey: .userId)
        pairId = try container.decode(Int.self, forKey: .pairId)
        
        amount = try container.decodeStringToDouble(.amount)
        price = try container.decodeStringToDouble(.price)
        amount2 = try container.decodeStringToDouble(.amount2)
    }
}
