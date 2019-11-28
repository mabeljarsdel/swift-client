//
//  StexWalletProtocol.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 08.11.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexWalletProtocol: Codable {
    
    public var name: String
    public var id: Int
    public var isActive: Bool
    public var feeCurrencyId: Int
    public var feeCurrencyCode: String?
    public var feeConst: Double?
    public var feePresent: Double?
    public var explorerUrlString: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "protocol_name"
        case id = "protocol_id"
        case isActive = "active"
        case feeCurrencyId = "withdrawal_fee_currency_id"
        case feeCurrencyCode = "withdrawal_fee_currency_code"
        case feeConst = "withdrawal_fee_const"
        case feePresent = "withdrawal_fee_percent"
        case explorerUrlString = "block_explorer_url"
    }
}
