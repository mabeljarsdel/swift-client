//
//  StexSocketResponce.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 10.12.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public struct StexSocketResponse<Model: Codable> {
    
    public var objects: [Model]
    public var event: String
    
    init?(with data: [Any]) {
        guard let event = data.first as? String else { return nil }
        self.event = event
        
        objects = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
    }
}
