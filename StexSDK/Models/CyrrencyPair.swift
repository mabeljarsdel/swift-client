//
//  CyrrencyPair.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class CyrrencyPair: Codable {
    
    public var id: Int
    public var currencyId: Int
    public var currencyCode: String
    public var currencyName: String
    public var marketCurrencyId: Int
    public var marketCode: String
    public var marketName: String
    public var minOrderAmount: Double?
    public var minBuyPrice: Double?
    public var minSellPrice: Double?
    public var buyFeePercent: Double?
    public var sellFeePercent: Double?
    public var isActive: Bool
    public var isDelisted: Bool
    public var pairMessage: String?
    public var currencyPrecision: Int
    public var marketPrecision: Int
    public var symbol: String
    public var groupName: String
    public var groupId: Int
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
