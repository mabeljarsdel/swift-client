//
//  BestPriceChanged.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class BestPriceChanged: Codable {
    
    /// Best Price.
    public var bestPrice: Double?
    
    /// Currency pair ID.
    public var pairId: Int
    
    /// Order type ID.
    public var orderTypeId: Int
    
    /// Timestamp in miliseconds.
    public var timestampMs: Double
    
    enum CodingKeys: String, CodingKey {
        case bestPrice = "best_price"
        case pairId = "currency_pair_id"
        case orderTypeId = "order_type_id"
        case timestampMs = "timestamp_ms"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        pairId = try container.decode(Int.self, forKey: .pairId)
        orderTypeId = try container.decode(Int.self, forKey: .orderTypeId)
        timestampMs = try container.decode(Double.self, forKey: .timestampMs)
        
        bestPrice = try container.decodeStringToDouble(.bestPrice)
    }
}
