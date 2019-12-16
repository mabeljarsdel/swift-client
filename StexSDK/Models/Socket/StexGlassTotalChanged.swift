//
//  StexGlassTotalChanged.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexGlassTotalChanged: Codable {
    /// Сurrency pair ID
    public var pairId: Int
    
    /// Total glass value
    public var total: Double
    
    enum CodingKeys: String, CodingKey {
        case pairId = "currency_pair_id"
        case total
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        pairId = try container.decode(Int.self, forKey: .pairId)
        
        total = try container.decodeStringToDouble(.total)
    }
}
