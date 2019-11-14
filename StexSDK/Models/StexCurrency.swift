//
//  StexCurrency.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexCurrency: Codable {
    
    /// Currency ID.
    ///
    /// Example: `1`
    public var id: Int
    
    /// Currency code (short name).
    ///
    /// Example: `BTC`
    public var code: String
    
    /// Currency full name.
    ///
    /// Example: `Bitcoin`
    public var name: String
    
    /// Currency status.
    ///
    /// Example: `true`
    public var isActive: Bool
    
    /// Is currency delisted.
    ///
    /// Example: `false`
    public var isDelisted: Bool
    
    /// The number of the digits after comma.
    ///
    /// Example: `8`
    public var precision: Int
    
    /// The minimum number of network confirmations required to credit the deposit
    public var minimumTXconfirmations: Int
    
    /// Minimum amount that can be withdrawn.
    ///
    /// Example: `0.009`
    public var minimumWithdrawalAmount: Double?
    
    /// Minimum amount that can be deposited.
    ///
    /// Example: `0.000003`
    public var minimumDepositAmount: Double?
    
    /// Currency id of the fee for deposit.
    ///
    /// Example: `1`
    public var depositFeeCurrencyId: Int
    
    /// Currency code of the fee for deposit.
    ///
    /// Example: `ETH`
    public var depositFeeCurrencyCode: String
    
    /// The fee amount that is taken for deposit (if not calculated as percent).
    ///
    /// Example: `0.00001`
    public var depositFeeConst: Double?
    
    /// The percent that is taken as deposit fee (if not set in deposit_fee_const).
    ///
    /// Example: `0`
    public var depositFeePercent: Double?
    
    /// Currency id of the fee for withdrawals.
    ///
    /// Example: `1`
    public var withdrawalFeeCurrencyId: Int
    
    /// Currency code of the fee for deposit.
    ///
    /// Example: `ETH`
    public var withdrawalFeeCurrencyCode: String
    
    /// The fee amount that is taken for withdrawal (if not calculated as percent).
    ///
    /// Example: `0.0015`
    public var withdrawalFeeConst: Double?
    
    /// The percent that is taken as withdrawal fee (if not set in deposit_fee_const).
    ///
    /// Example: `0`
    public var withdrawalFeePercent: Double?
    
    /// Block explorer URL.
    ///
    /// Example: `https://blockchain.info/tx/`
    public var blockExplorerURL: String?
    
    public var protocolSettings: [StexWalletProtocol]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case name
        case isActive = "active"
        case isDelisted = "delisted"
        case precision
        case minimumWithdrawalAmount = "minimum_withdrawal_amount"
        case minimumDepositAmount = "minimum_deposit_amount"
        case depositFeeCurrencyId = "deposit_fee_currency_id"
        case depositFeeCurrencyCode = "deposit_fee_currency_code"
        case depositFeeConst = "deposit_fee_const"
        case depositFeePercent = "deposit_fee_percent"
        case withdrawalFeeCurrencyId = "withdrawal_fee_currency_id"
        case withdrawalFeeCurrencyCode = "withdrawal_fee_currency_code"
        case withdrawalFeeConst = "withdrawal_fee_const"
        case withdrawalFeePercent = "withdrawal_fee_percent"
        case blockExplorerURL = "block_explorer_url"
        case protocolSettings = "protocol_specific_settings"
        case minimumTXconfirmations = "minimum_tx_confirmations"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        code = try container.decode(String.self, forKey: .code)
        name = try container.decode(String.self, forKey: .name)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        isDelisted = try container.decode(Bool.self, forKey: .isDelisted)
        precision = try container.decode(Int.self, forKey: .precision)
        depositFeeCurrencyId = try container.decode(Int.self, forKey: .depositFeeCurrencyId)
        depositFeeCurrencyCode = try container.decode(String.self, forKey: .depositFeeCurrencyCode)
        withdrawalFeeCurrencyId = try container.decode(Int.self, forKey: .withdrawalFeeCurrencyId)
        withdrawalFeeCurrencyCode = try container.decode(String.self, forKey: .withdrawalFeeCurrencyCode)
        blockExplorerURL = try container.decodeIfPresent(String.self, forKey: .blockExplorerURL)
        protocolSettings = try? container.decode([StexWalletProtocol].self, forKey: .protocolSettings)
        minimumTXconfirmations = try container.decode(Int.self, forKey: .minimumTXconfirmations)
        
        minimumWithdrawalAmount = try container.decodeStringToDouble(.minimumWithdrawalAmount)
        minimumDepositAmount = try container.decodeStringToDouble(.minimumDepositAmount)
        depositFeeConst = try container.decodeStringToDouble(.depositFeeConst)
        depositFeePercent = try container.decodeStringToDouble(.depositFeePercent)
        withdrawalFeeConst = try container.decodeStringToDouble(.withdrawalFeeConst)
        withdrawalFeePercent = try container.decodeStringToDouble(.withdrawalFeePercent)
    }
}
