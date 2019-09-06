//
//  CandleChanged.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class IdObject: Codable {
    
    /// Currency pair id
    public var pairId: Int
    
    /// Candle timestamp
    public var timestamp: Double
    
    enum CodingKeys: String, CodingKey {
        case pairId = "currency_pair_id"
        case timestamp
    }
}

public class CandleChanged: Candle {
    
    /// ID object
    public var id: IdObject
    
    /// Trades count for candle period
    public var count: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case count
        case time
        case close
        case open
        case high
        case low
        case volume
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(IdObject.self, forKey: .id)
        count = try container.decode(Int.self, forKey: .count)
        
        try super.init(from: decoder)
        
        time = id.timestamp
    }
}
