//
//  SocketConstants.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

struct SocketConstants {
    static let socketURL = "https://socket.stex.com"
    
    struct Param {
        static let channel = "channel"
        static let auth = "auth"
        static let headers = "headers"
        static let authorization = "Authorization"
        static let bearer = "Bearer"
    }
    
    struct Event {
        static let connect = "connect"
        static let disconnect = "disconnect"
        static let subscribe = "subscribe"
        
        static let ticker = "App\\Events\\Ticker"
        static let tradeCreated = "App\\Events\\OrderFillCreated"
        static let glassTotalChanget = "App\\Events\\GlassTotalChanged"
    }
    
    struct Channels {
        static let rate = "rate"
        static let tradeCreated = "trade_c"
        static let sellGlassTotalChanget = "sell_total_data"
        static let buyGlassTotalChanget = "buy_total_data"
    }
}
