//
//  Fee.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class Fee: Codable {
    
    /// Sell fee
    public var sellFee: Double
    
    /// Buy fee
    public var buyFee: Double
    
    enum CodingKeys: String, CodingKey {
        case sellFee = "sell_fee"
        case buyFee = "buy_fee"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        sellFee = try container.decodeStringToDouble(.sellFee) ?? 0
        buyFee = try container.decodeStringToDouble(.buyFee) ?? 0
    }
}
