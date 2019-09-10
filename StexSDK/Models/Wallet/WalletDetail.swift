//
//  WalletDetail.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class WalletDetail: Wallet {
    public var depositAddress: DepositAddress
    
    /// If the withdrawal supports additional address parameter (e.g. Destination Tag or Payment ID) this name will be returned here. This field is always optional, however it can be mandatary at the recipient side
    public var withdrawalAdditionalFieldName: String?
    
    enum DetailCodingKeys: String, CodingKey {
        case depositAddress = "deposit_address"
        case withdrawalAdditionalFieldName = "withdrawal_additional_field_name"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DetailCodingKeys.self)
        
        depositAddress = try container.decode(DepositAddress.self, forKey: .depositAddress)
        withdrawalAdditionalFieldName = try? container.decode(String.self, forKey: .withdrawalAdditionalFieldName)
        
        try super.init(from: decoder)
    }
}
