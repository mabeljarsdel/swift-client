//
//  Order.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class Order: Codable {
    
    /// Unique ID of the order
    public var id: Int
    
    /// Id of the currency pair the order is placed at
    public var pairId: Int
    
    /// The price of the order
    public var price: Double
    
    /// The stop price of the stop-limit order
    public var triggerPrice: Double?
    
    /// Amount of the order
    public var initialAmount: Double?
    
    /// Amount that already has been processed at the time of request
    public var processedAmount: Double?
    
    /// Order type
    public var type: TradeType
    
    /// Order type
    public var originalType: OrderType
    
    /// Order creation timestamp (in seconds) UTC
    public var timestamp: Double
    
    /// Order status at the time of the request
    public var status: OrderStatus
    
    enum CodingKeys: String, CodingKey {
        case id
        case pairId = "currency_pair_id"
        case price
        case triggerPrice = "trigger_price"
        case initialAmount = "initial_amount"
        case processedAmount = "processed_amount"
        case type
        case originalType = "original_type"
        case timestamp
        case status
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        pairId = try container.decode(Int.self, forKey: .pairId)
        type = try container.decode(TradeType.self, forKey: .type)
        originalType = try container.decode(OrderType.self, forKey: .originalType)
        status = try container.decode(OrderStatus.self, forKey: .status)
        
        price = try container.decodeStringToDouble(.price) ?? 0
        triggerPrice = try container.decodeStringToDouble(.triggerPrice)
        initialAmount = try container.decodeStringToDouble(.initialAmount)
        processedAmount = try container.decodeStringToDouble(.processedAmount)
        timestamp = try container.decodeStringToDouble(.timestamp) ?? 0
    }
}
