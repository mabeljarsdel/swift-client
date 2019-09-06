//
//  UserOrderDeleted.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class UserOrderDeleted: Codable {
    
    /// Order ID
    public var id: Int
    
    /// User ID
    public var userId: Int
    
    /// Currency pair ID
    public var pairId: Int
    
    /// Order actual status
    public var status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case pairId = "currency_pair_id"
        case status
    }
}
