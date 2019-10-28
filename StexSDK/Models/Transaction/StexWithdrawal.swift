//
//  Withdrawal.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public typealias StexWithdrawalAddress = StexDepositAddress

public class StexWithdrawal: Codable {
    public var id: Int
    public var currencyId: Int
    public var currencyCode: String
    public var feeCurrencyId: Int
    public var feeCurrencyCode: String
    public var amount: Double
    public var fee: Double
    
    /// Transaction id.
    public var txid: String?
    public var status: WithdrawalStatus
    public var createdTs: Double
    public var updatetTs: Double
    public var withdrawalAddress: StexWithdrawalAddress
    
    enum CodingKeys: String, CodingKey {
        case id
        case currencyId = "currency_id"
        case currencyCode = "currency_code"
        case feeCurrencyId = "fee_currency_id"
        case feeCurrencyCode = "fee_currency_code"
        case amount
        case fee
        case txid
        case status
        case createdTs = "created_ts"
        case updatetTs = "updated_ts"
        case withdrawalAddress = "withdrawal_address"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        currencyId = try container.decode(Int.self, forKey: .currencyId)
        currencyCode = try container.decode(String.self, forKey: .currencyCode)
        feeCurrencyId = try container.decode(Int.self, forKey: .feeCurrencyId)
        feeCurrencyCode = try container.decode(String.self, forKey: .feeCurrencyCode)
        txid = try? container.decode(String.self, forKey: .txid)
        status = try container.decode(WithdrawalStatus.self, forKey: .status)
        withdrawalAddress = try container.decode(StexWithdrawalAddress.self, forKey: .withdrawalAddress)
        
        amount = try container.decodeStringToDouble(.amount) ?? 0
        fee = try container.decodeStringToDouble(.fee) ?? 0
        createdTs = try container.decodeStringToDouble(.createdTs) ?? 0
        updatetTs = try container.decodeStringToDouble(.updatetTs) ?? 0
    }
}
