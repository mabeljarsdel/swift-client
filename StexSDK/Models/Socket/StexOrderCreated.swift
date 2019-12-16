//
//  StexOrderCreated.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexOrderCreated: Codable {
    
    /// Trade ID
    public var id: Int
    
    /// Buy order ID
    public var buyOrderId: Int
    
    /// Sell order ID
    public var sellOrderId: Int
    
    /// Currency pair ID
    public var pairId: Int
    
    /// Trade price
    public var price: Double
    
    /// Trade amount
    public var amount: Double
    
    /// Trade amount in market currency
    public var amount2: Double
    
    /// Trade type SELL / BUY
    public var type: StexTradeType
    
    /// Timestamp of the trade
    public var timestamp: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case buyOrderId = "buy_order_id"
        case sellOrderId = "sell_order_id"
        case pairId = "currency_pair_id"
        case price
        case amount
        case amount2
        case type = "order_type"
        case timestamp
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        buyOrderId = try container.decode(Int.self, forKey: .buyOrderId)
        sellOrderId = try container.decode(Int.self, forKey: .sellOrderId)
        pairId = try container.decode(Int.self, forKey: .pairId)
        type = try container.decode(StexTradeType.self, forKey: .type)
        timestamp = try container.decode(Double.self, forKey: .timestamp)
        amount2 = try container.decode(Double.self, forKey: .amount2)
        
        price = try container.decodeStringToDouble(.price)
        amount = try container.decodeStringToDouble(.amount)
    }
}
