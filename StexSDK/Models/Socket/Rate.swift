//
//  Rate.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/15/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class Rate: Codable {
    
    /// Currency pair ID.
    public var id: Int
    
    /// Number of trades past 24 hours.
    public var closedOrders: Int
    
    /// Price of the last trade.
    public var lastPrice: Double?
    
    /// 24 hours opening price.
    public var lastPriceDayAgo: Double?
    
    /// 24 hours volume in market currency.
    public var marketVolume: Double?
    
    /// Maximum trade price for the last 24 hours.
    public var maxBuy: Double?
    
    /// Minimum trade price for the last 24 hours.
    public var minSell: Double?
    
    /// Number of valuable digits after comma.
    public var precision: Int
    
    /// Price change in percent.
    public var spread: Double?
    
    /// 24 hours volume.
    public var volumeSum: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case closedOrders
        case lastPrice
        case lastPriceDayAgo
        case marketVolume = "market_volume"
        case maxBuy
        case minSell
        case precision
        case spread
        case volumeSum
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        closedOrders = try container.decode(Int.self, forKey: .closedOrders)
        precision = try container.decode(Int.self, forKey: .precision)
        
        spread = try container.decodeStringToDouble(.spread)
        lastPrice = try container.decodeStringToDouble(.lastPrice)
        lastPriceDayAgo = try container.decodeStringToDouble(.lastPriceDayAgo)
        marketVolume = try container.decodeStringToDouble(.marketVolume)
        maxBuy = try container.decodeStringToDouble(.maxBuy)
        minSell = try container.decodeStringToDouble(.minSell)
        volumeSum = try container.decodeStringToDouble(.volumeSum)
    }
}
