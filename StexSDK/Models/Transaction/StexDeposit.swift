//
//  StexDeposit.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexDeposit: Codable {
    
    public var id: Int
    public var currencyId: Int
    public var currencyCode: String
    public var depositFeeCurrencyId: Int
    public var depositFeeCurrencyCode: String
    public var amount: Double
    public var fee: Double
    
    /// Transaction id.
    public var txid: String?
    public var status: String
    public var statusColorHash: String
    public var statusId: Int
    public var timestamp: Double
    
    /// A string representing the current number of confirmations compared to required number of confirmations.
    ///
    /// Example: `1 of 2`
    public var confirmations: String?
    public var protocolId: Int?
    
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
        case statusColorHash = "status_color"
        case statusId = "deposit_status_id"
        case timestamp
        case confirmations
        case protocolId = "protocol_id"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        currencyId = try container.decode(Int.self, forKey: .currencyId)
        currencyCode = try container.decode(String.self, forKey: .currencyCode)
        depositFeeCurrencyId = try container.decode(Int.self, forKey: .depositFeeCurrencyId)
        depositFeeCurrencyCode = try container.decode(String.self, forKey: .depositFeeCurrencyCode)
        txid = try? container.decode(String.self, forKey: .txid)
        status = try container.decode(String.self, forKey: .status)
        statusColorHash = try container.decode(String.self, forKey: .statusColorHash)
        statusId = try container.decode(Int.self, forKey: .statusId)
        confirmations = try? container.decode(String.self, forKey: .confirmations)
        protocolId = try? container.decode(Int.self, forKey: .protocolId)
        
        amount = try container.decodeStringToDouble(.amount) ?? 0
        fee = try container.decodeStringToDouble(.fee) ?? 0
        timestamp = try container.decodeStringToDouble(.timestamp) ?? 0
    }
}
