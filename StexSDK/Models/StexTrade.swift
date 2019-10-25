//
//  StexTrade.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexTrade: Codable {
    
    /// Currency pair ID.
    ///
    /// Example: `1`
    public var id: Int
    
    /// Price.
    ///
    /// Example: `0.0337`
    public var price: Double?
    
    /// Amount.
    ///
    /// Example: `6.754`
    public var amount: Double?
    
    /// Trade type.
    ///
    /// Example: `sell`
    public var type: StexTradeType
    
    /// Timestamp.
    ///
    /// Example: `1538737692`
    public var timestamp: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case price
        case amount
        case type
        case timestamp
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        type = try container.decode(StexTradeType.self, forKey: .type)
        
        price = try container.decodeStringToDouble(.price)
        amount = try container.decodeStringToDouble(.amount)
        timestamp = try container.decodeStringToDouble(.timestamp)!
    }
}
