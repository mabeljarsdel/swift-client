//
//  OrderFee.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class OrderFee: Codable {
    public var id: Int
    public var pairId: Int
    public var amount: Double
    public var timestemp: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case pairId = "currency_id"
        case amount
        case timestemp
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        pairId = try container.decode(Int.self, forKey: .pairId)
        
        amount = try container.decodeStringToDouble(.amount) ?? 0
        timestemp = try container.decodeStringToDouble(.timestemp) ?? 0
    }
}
