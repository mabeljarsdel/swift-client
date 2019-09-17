//
//  StexCanceledOrders.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexCanceledOrders: Codable {
    
    /// Array of Orders that were successfully put into processing queue for cancelling
    public var putIntoProcessingQueue: [StexOrder]
    
    /// Array of Orders that were NOT put into processing queue for cancelling
    public var notPutIntoProcessingQueue: [StexOrder]
    
    /// A message from server
    public var message: String?
    
    enum CodingKeys: String, CodingKey {
        case putIntoProcessingQueue = "put_into_processing_queue"
        case notPutIntoProcessingQueue = "not_put_into_processing_queue"
        case message
    }
}
