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
        static let glassRowChanget = "App\\Events\\GlassRowChanged"
        static let bestPriceChanged = "App\\Events\\BestPriceChanged"
        static let candleChanged = "App\\Events\\CandleChanged"
        static let balanceChanged = "App\\Events\\BalanceChanged"
        static let userOrder = "App\\Events\\UserOrder"
        static let userOrderDeleted = "App\\Events\\UserOrderDeleted"
    }
    
    struct Channels {
        static let rate = "rate"
        static let tradeCreated = "trade_c"
        static let sellGlassTotalChanget = "sell_total_data"
        static let buyGlassTotalChanget = "buy_total_data"
        static let sellGlassRowChanget = "sell_data"
        static let buyGlassRowChanget = "buy_data"
        static let bidBestPriceChanged = "best_bid_price_"
        static let askBestPriceChanged = "best_ask_price_"
        static let candleChanged = "stats_data_%@_%@"
        static let balanceChanged = "private-balance_changed_w_"
        static let sellUserOrder = "private-sell_user_data_u%@c%@"
        static let buyUserOrder = "private-buy_user_data_u%@c%@"
        static let delUserOrder = "private-del_order_u%@c%@"
    }
}
