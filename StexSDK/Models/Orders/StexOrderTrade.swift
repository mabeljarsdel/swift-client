//
//  StexOrderTrade.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexOrderTrade: Codable {
    public var id: Int
    public var buyOrderId: Int
    public var sellOrderId: Int
    public var price: Double
    public var amount: Double
    public var type: StexTradeType
    public var timestemp: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case buyOrderId = "buy_order_id"
        case sellOrderId = "sell_order_id"
        case price
        case amount
        case type = "trade_type"
        case timestemp
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        buyOrderId = try container.decode(Int.self, forKey: .buyOrderId)
        sellOrderId = try container.decode(Int.self, forKey: .sellOrderId)
        type = try container.decode(StexTradeType.self, forKey: .type)
        
        amount = try container.decodeStringToDouble(.amount) ?? 0
        price = try container.decodeStringToDouble(.price) ?? 0
        timestemp = try container.decodeStringToDouble(.timestemp) ?? 0
    }
}
