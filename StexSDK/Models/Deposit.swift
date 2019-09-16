//
//  Deposit.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class Deposit: Codable {
    
    public var id: Int
    public var currencyId: Int
    public var currencyCode: String
    public var depositFeeCurrencyId: Int
    public var depositFeeCurrencyCode: String
    public var amount: Double
    public var fee: Double
    
    /// Transaction id.
    public var txid: String?
    public var status: DepositStatus
    public var timestamp: Double
    
    /// A string representing the current number of confirmations compared to required number of confirmations.
    ///
    /// Example: `1 of 2`
    public var confirmations: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case currencyId = "currency_id"
        case currencyCode = "currency_code"
        case depositFeeCurrencyId = "deposit_fee_currency_id"
        case depositFeeCurrencyCode = "deposit_fee_currency_code"
        case amount
        case fee
        case txid
        case status
        case timestamp
        case confirmations
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        currencyId = try container.decode(Int.self, forKey: .currencyId)
        currencyCode = try container.decode(String.self, forKey: .currencyCode)
        depositFeeCurrencyId = try container.decode(Int.self, forKey: .depositFeeCurrencyId)
        depositFeeCurrencyCode = try container.decode(String.self, forKey: .depositFeeCurrencyCode)
        txid = try? container.decode(String.self, forKey: .txid)
        status = try container.decode(DepositStatus.self, forKey: .status)
        confirmations = try? container.decode(String.self, forKey: .confirmations)
        
        amount = try container.decodeStringToDouble(.amount) ?? 0
        fee = try container.decodeStringToDouble(.fee) ?? 0
        timestamp = try container.decodeStringToDouble(.timestamp) ?? 0
    }
}
