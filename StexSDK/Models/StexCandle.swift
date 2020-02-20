//
//  StexCandle.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/7/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexCandle: Codable {
    
    /// Timestamp in milliseconds.
    ///
    /// Example: `1538737692000`
    public var time: Double?
    
    /// Candle close price.
    ///
    /// Example: `0.022276`
    public var close: Double?
    
    /// Candle open price.
    ///
    /// Example: `0.012285`
    public var open: Double?
    
    /// Candle highest price.
    ///
    /// Example: `0.032276`
    public var high: Double?
    
    /// Candle lowest price.
    ///
    /// Example: `0.002276`
    public var low: Double?
    
    /// Tradig voume during candle period.
    ///
    /// Example: `6.456001`
    public var volume: Double?
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        time = try? container.decodeDouble(.time)
        volume = try? container.decodeDouble(.time)
        
        close = try? container.decodeDouble(.close)
        open = try? container.decodeDouble(.open)
        high = try? container.decodeDouble(.high)
        low = try? container.decodeDouble(.low)
    }
}
