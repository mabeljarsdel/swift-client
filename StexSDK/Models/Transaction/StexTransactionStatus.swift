//
//  StexTransactionStatus.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 28.10.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexTransactionStatus: Codable {
    
    /// Status ID
    public var id: Int
    
    /// Status name
    public var name: String
    
    /// Preferred foreground color for this status.
    public var statusColorHash: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case statusColorHash = "status_color"
    }
}

public typealias StexDepositStatus = StexTransactionStatus
public typealias StexWithdrawalStatus = StexTransactionStatus
