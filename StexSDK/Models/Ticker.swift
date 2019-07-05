//
//  Ticker.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class Ticker: Codable {
    
    /// Currency pair ID.
    ///
    /// Example: `1`
    public var id: Int
    
    /// Multiplier for the ammpont. Used if the currency in the pair is too cheap to be trade, In this case a lot is sold.
    ///
    /// Example: `1`
    public var amountMultiplier: Int
    
    /// Code of the currency.
    ///
    /// Example: `ETH`
    public var currencyCode: String
    
    /// Code of the market currency.
    ///
    /// Example: `BTC`
    public var marketCode: String
    
    /// Full name of the currency.
    ///
    /// Example: `Etherium`
    public var currencyName: String
    
    /// Full name of the market currency.
    ///
    ///Example: `Bitcoin`
    public var marketName: String
    
    /// Currency Pair Group symbol.
    ///
    /// Example: `ETH_BTC`
    public var symbol: String
    
    /// Currency Pair Group name.
    ///
    /// Example: `FIAT coins`
    public var groupName: String
    
    /// Currency Pair Group id.
    ///
    /// Example: `1`
    public var groupId: Int
    
    /// Best ASK.
    ///
    /// Example: `0.03377988`
    public var ask: Double?
    
    /// Best BID.
    ///
    /// Example: `0.03350001`
    public var bid: Double?
    
    /// Last trade price.
    ///
    /// Example: `0.0337`
    public var last: Double?
    
    /// Min trade price of the last 24 hours.
    ///
    /// Example: `0.03320157`
    public var low: Double?
    
    /// Max trade price of the last 24 hours.
    ///
    /// Example: `0.0341`
    public var high: Double?
    
    /// Trade price 24 hours ago.
    ///
    /// Example: `0.03340002`
    public var open: Double?
    
    /// Trading volume in market currency of the last 24 hours.
    ///
    /// Example: `5.1939`
    public var volume: Double?
    
    /// Trading volume in currency of the last 24 hours.
    ///
    /// Example: `154.12169946`
    public var volumeQuote: Double?
    
    /// Exchange rates of market currency to FIAT currencies (if available). USD rate is returned at the moment.
    ///
    /// Example: `USD: 123.123`
    public var fiatsRate: [String: Double]
    
    /// Timestamp of the provided data.
    ///
    /// Example: `1538737692`
    public var timestamp: Double
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case amountMultiplier = "amount_multiplier"
        case currencyCode = "currency_code"
        case marketCode = "market_code"
        case currencyName = "currency_name"
        case marketName = "market_name"
        case symbol
        case groupName = "group_name"
        case groupId = "group_id"
        case ask
        case bid
        case last
        case low
        case high
        case open
        case volume
        case volumeQuote
        case fiatsRate
        case timestamp
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        amountMultiplier = try container.decode(Int.self, forKey: .amountMultiplier)
        currencyCode = try container.decode(String.self, forKey: .currencyCode)
        marketCode = try container.decode(String.self, forKey: .marketCode)
        currencyName = try container.decode(String.self, forKey: .currencyName)
        marketName = try container.decode(String.self, forKey: .marketName)
        symbol = try container.decode(String.self, forKey: .symbol)
        groupName = try container.decode(String.self, forKey: .groupName)
        groupId = try container.decode(Int.self, forKey: .groupId)
        fiatsRate = try container.decode([String: Double].self, forKey: .fiatsRate)
        timestamp = try container.decode(Double.self, forKey: .timestamp)
        
        ask = try container.decodeStringToDouble(.ask)
        bid = try container.decodeStringToDouble(.bid)
        last = try container.decodeStringToDouble(.last)
        low = try container.decodeStringToDouble(.low)
        high = try container.decodeStringToDouble(.high)
        open = try container.decodeStringToDouble(.open)
        volume = try container.decodeStringToDouble(.volume)
        volumeQuote = try container.decodeStringToDouble(.volumeQuote)
    }
}
