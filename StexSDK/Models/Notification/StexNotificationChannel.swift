//
//  StexNotificationChannel.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexNotificationChannel: Codable {
    
    public var name: String
    public var humanName: String
    
    /// Can in general case this channel be used to deliver messages for this event?
    public var isEnabled: Bool
    
    /// Is channel used to deliver messages of this event for the current user?
    public var isSelected: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case humanName = "human_name"
        case isEnabled = "enabled"
        case isSelected = "selected"
    }
}
