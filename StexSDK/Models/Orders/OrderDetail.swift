//
//  OrderDetail.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class OrderDetail: Order {
    
    /// A list of trades filled the order
    public var trades: [OrderTrade]
    
    /// A list of fees taken for every trade
    public var fees: [OrderFee]
    
    enum DetailCodingKeys: String, CodingKey {
        case trades
        case fees
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DetailCodingKeys.self)
        
        trades = try container.decode(Array<OrderTrade>.self, forKey: .trades)
        fees = try container.decode(Array<OrderFee>.self, forKey: .fees)
        
        try super.init(from: decoder)
    }
}
