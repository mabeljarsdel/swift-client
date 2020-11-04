//
//  StexOrderbookOrder.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexOrderbookOrder: Codable {
    
    /// Currency pair ID.
    ///
    /// Example: `1`
    public var pairId: Int
    
    /// Order amount.
    ///
    /// Example: `0.71499228`
    public var amount: Double?
    
    /// Order price.
    ///
    /// Example: `0.1987863`
    public var price: Double?
    
    /// Product of the amount and price.
    ///
    /// Example: `0.01421306`
    public var amount2: Double?
    
    /// Count of orders in orderbook.
    ///
    /// Example: `1`
    public var count: Int
    
    /// Sum of all previous orders
    ///
    /// Example: `0.71499228`
    public var cumulativeAmount: Double?
    
    ///Type of order
    ///
    ///Example: "SELL"
    public var type: String?
    
    enum CodingKeys: String, CodingKey {
        case pairId = "currency_pair_id"
        case amount
        case price
        case amount2
        case count
        case cumulativeAmount = "cumulative_amount"
        case type
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        pairId = try container.decode(Int.self, forKey: .pairId)
        count = try container.decode(Int.self, forKey: .count)
        cumulativeAmount = try? container.decode(Double.self, forKey: .cumulativeAmount)
        type = try? container.decode(String.self, forKey: .type)
        
        amount = try container.decodeStringToDouble(.amount)
        price = try container.decodeStringToDouble(.price)
        amount2 = try container.decodeStringToDouble(.amount2)
    }
}
