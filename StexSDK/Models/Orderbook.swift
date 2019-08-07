//
//  Orderbook.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class Orderbook: Codable {
    
    /// ASK orders.
    public var ask: [OrderbookOrder]
    
    /// BID orders.
    public var bid: [OrderbookOrder]
    
    /// Total amount of the all ASK orders.
    ///
    /// Example: `2472.67076223`
    public var askTotalAmount: Double
    
    /// Total amount of the all BID orders.
    ///
    /// Example: `0.87406651`
    public var bidTotalAmount: Double
    
    enum CodingKeys: String, CodingKey {
        case ask
        case bid
        case askTotalAmount = "ask_total_amount"
        case bidTotalAmount = "bid_total_amount"
    }
}
