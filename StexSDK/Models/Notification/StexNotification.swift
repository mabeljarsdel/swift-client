//
//  StexNotification.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexNotification: Codable {
    
    public var name: String
    public var humanName: String
    
    /// Is this event enabled to use?
    public var isEnabled: Bool
    
    public var channels: [StexNotificationChannel]
    
    enum CodingKeys: String, CodingKey {
        case name
        case humanName = "human_name"
        case isEnabled = "enabled"
        case channels
    }
}
