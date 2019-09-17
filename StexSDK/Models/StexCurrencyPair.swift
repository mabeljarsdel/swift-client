//
//  CurrencyPair.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexCurrencyPair: Codable {
    
    /// Currency pair ID.
    ///
    /// Example: `1`
    public var id: Int
    
    /// Currency id as returned by `/public/currencies`.
    ///
    /// Example: `2`
    public var currencyId: Int
    
    /// Currency code as returned by `/public/currencies`.
    ///
    /// Example: `ETH`
    public var currencyCode: String
    
    /// Full name of the currency.
    ///
    /// Example: `Etherium`
    public var currencyName: String
    
    /// Currency id of the market currency as returned by `/public/currencies`.
    ///
    /// Example: `1`
    public var marketCurrencyId: Int
    
    /// CurrencyPairGroup code as returned by /public/markets.
    ///
    /// Example: `BTC`
    public var marketCode: String
    
    /// Full name of the market.
    ///
    /// Example: `Bitcoin`
    public var marketName: String
    
    /// The minimum amount of the order that can be placed.
    ///
    /// Example: `0.0000001`
    public var minOrderAmount: Double?
    
    /// The minimum price of the bid.
    ///
    /// Example: `0.0000001`
    public var minBuyPrice: Double?
    
    /// The minimum price of the ask.
    ///
    /// Example: `0.0000001`
    public var minSellPrice: Double?
    
    /// Bid fee in percents.
    ///
    /// Example: `0`
    public var buyFeePercent: Double?
    
    /// Ask fee in percents.
    ///
    /// Example: `0`
    public var sellFeePercent: Double?
    
    /// Indicates is the currency pair active (trades are enabled) or not.
    ///
    /// Example: `true`
    public var isActive: Bool
    
    /// Indicates if the currency pair is delisted.
    ///
    /// Example: `false`
    public var isDelisted: Bool
    
    /// Message that is shown on the currency pair trade page.
    ///
    /// Example: `Happy trading!`
    public var pairMessage: String?
    
    /// Number of decimal places allowed for this currency.
    ///
    /// Example: `8`
    public var currencyPrecision: Int
    
    /// Number of decimal places allowed for the currency of the market.
    ///
    /// Example: `8`
    public var marketPrecision: Int
    
    /// CurrencyPairGroup symbol.
    ///
    /// Example: `ETH_BTC`
    public var symbol: String
    
    /// Currency pair group name.
    ///
    /// Example: `Fiat coins`
    public var groupName: String
    
    /// Currency pair group ID.
    ///
    /// Example: `1`
    public var groupId: Int
    
    /// Amount multiplier used to trade for some pairs with low price.
    ///
    /// Example: `1`
    public var amountMultiplier: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case currencyId = "currency_id"
        case currencyCode = "currency_code"
        case currencyName = "currency_name"
        case marketCurrencyId = "market_currency_id"
        case marketCode = "market_code"
        case marketName = "market_name"
        case minOrderAmount = "min_order_amount"
        case minBuyPrice = "min_buy_price"
        case minSellPrice = "min_sell_price"
        case buyFeePercent = "buy_fee_percent"
        case sellFeePercent = "sell_fee_percent"
        case isActive = "active"
        case isDelisted = "delisted"
        case pairMessage = "pair_message"
        case currencyPrecision = "currency_precision"
        case marketPrecision = "market_precision"
        case symbol
        case groupName = "group_name"
        case groupId = "group_id"
        case amountMultiplier = "amount_multiplier"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        currencyId = try container.decode(Int.self, forKey: .currencyId)
        currencyCode = try container.decode(String.self, forKey: .currencyCode)
        currencyName = try container.decode(String.self, forKey: .currencyName)
        marketCurrencyId = try container.decode(Int.self, forKey: .marketCurrencyId)
        marketCode = try container.decode(String.self, forKey: .marketCode)
        marketName = try container.decode(String.self, forKey: .marketName)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        isDelisted = try container.decode(Bool.self, forKey: .isDelisted)
        pairMessage = try container.decodeIfPresent(String.self, forKey: .pairMessage)
        currencyPrecision = try container.decode(Int.self, forKey: .currencyPrecision)
        marketPrecision = try container.decode(Int.self, forKey: .marketPrecision)
        symbol = try container.decode(String.self, forKey: .symbol)
        groupName = try container.decode(String.self, forKey: .groupName)
        groupId = try container.decode(Int.self, forKey: .groupId)
        amountMultiplier = try container.decodeIfPresent(Int.self, forKey: .amountMultiplier)
        
        minOrderAmount = try container.decodeStringToDouble(.minOrderAmount)
        minBuyPrice = try container.decodeStringToDouble(.minBuyPrice)
        minSellPrice = try container.decodeStringToDouble(.minSellPrice)
        buyFeePercent = try container.decodeStringToDouble(.buyFeePercent)
        sellFeePercent = try container.decodeStringToDouble(.sellFeePercent)
    }
}
