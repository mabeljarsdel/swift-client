//
//  StexGlassRowChanged.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexGlassRowChanged: Codable {
    
    /// Currency pair ID.
    public var pairId: Int
    
    /// Order amount.
    public var amount: Double
    
    /// Order price.
    public var price: Double
    
    /// Product of the amount and price.
    public var amount2: Double
    
    /// Count of orders in orderbook.
    public var count: Int
    
    enum CodingKeys: String, CodingKey {
        case pairId = "currency_pair_id"
        case amount
        case price
        case amount2
        case count
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        pairId = try container.decode(Int.self, forKey: .pairId)
        count = try container.decode(Int.self, forKey: .count)
        
        amount = try container.decodeStringToDouble(.amount)
        price = try container.decodeStringToDouble(.price)
        amount2 = try container.decodeStringToDouble(.amount2)
    }
}
