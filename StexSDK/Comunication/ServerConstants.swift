//
//  ServerConstants.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

typealias PublicEndpoints = ServerConstants.Endpoints.Public
typealias ProfileEndpoints = ServerConstants.Endpoints.Profile

public struct ServerConstants {
    
    static let baseUrl = "https://api3.stex.com/"
    
    struct Endpoints {
        private static let `public` = "public/"
        private static let profile = "profile/"
        
        enum Public: String {
            case ticker
            case currencies
            case markets
            case pairsGroups = "pairs-groups"
            case currencyPairs = "currency_pairs"
            case trades
            case orderbook
            case chart
            
            var path: String {
                return ServerConstants.baseUrl + Endpoints.public + rawValue
            }
        }
        
        enum Profile: String {
            case info
            
            var path: String {
                return ServerConstants.baseUrl + Endpoints.profile + rawValue
            }
        }
    }
    
    static let sort = "sort"
    static let limit = "limit"
    static let from = "from"
    static let till = "till"
    static let offset = "offset"
    static let limitBids = "limit_bids"
    static let limitAsks = "limit_asks"
    static let timeStart = "timeStart"
    static let timeEnd = "timeEnd"
}

public enum SortKey: String {
    case desc
    case asc
}

public enum TradeType: String, Codable {
    case sell = "SELL"
    case buy = "BUY"
}

public enum CandlesType: String {
    case oneMinute = "1"
    case fiveMinute = "5"
    case thirtyMinutes = "30"
    case oneHours = "60"
    case fourHours = "240"
    case twelveHours = "720"
    case oneDay
}
