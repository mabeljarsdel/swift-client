//
//  ServerConstants.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

typealias PublicEndpoints = ServerConstants.Endpoints.Public
typealias PrivateEndpoints = ServerConstants.Endpoints.Private

public struct ServerConstants {
    
    static let baseUrl = "https://api3.stex.com/"
    
    struct Endpoints {
        private static let `public` = "public/"
        private static let `private` = "private/"
        
        enum Public: String {
            case ticker
            case currencies
            case markets
            case pairsGroups = "pairs-groups"
            case currencyPairs = "currency_pairs"
            case trades
            
            var path: String {
                return ServerConstants.baseUrl + Endpoints.public + rawValue
            }
        }
        
        enum Private: String {
            case some
            
            var path: String {
                return ServerConstants.baseUrl + Endpoints.private + rawValue
            }
        }
    }
    
    static let sort = "sort"
    static let limit = "limit"
    static let from = "from"
    static let till = "till"
    static let offset = "offset"
}

public enum SortKey: String {
    case desc
    case asc
}

public enum TradeType: String, Codable {
    case sell = "SELL"
    case buy = "BUY"
}
