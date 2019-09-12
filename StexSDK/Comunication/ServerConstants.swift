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
typealias TradingEndpoints = ServerConstants.Endpoints.Trading
typealias TradingHistoryEndpoints = ServerConstants.Endpoints.TradingHistory

public struct ServerConstants {
    
    static let baseUrl = "https://api3.stex.com/"
    
    struct Endpoints {
        private static let `public` = "public/"
        private static let profile = "profile/"
        private static let trading = "trading/"
        private static let tradingHistory = "reports/"
        
        static let address = "/address"
        
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
            case wallets
            case deposits
            case withdrawals
            case withdraw
            
            var path: String {
                return ServerConstants.baseUrl + Endpoints.profile + rawValue
            }
        }
        
        enum Trading: String {
            case fees
            case orders
            case order
            
            var path: String {
                return ServerConstants.baseUrl + Endpoints.trading + rawValue
            }
        }
        
        enum TradingHistory: String {
            case orders
            case trades
            
            var path: String {
                return ServerConstants.baseUrl + Endpoints.tradingHistory + rawValue
            }
        }
    }
    
    static let sort = "sort"
    static let sortBy = "sortBy"
    static let limit = "limit"
    static let from = "from"
    static let till = "till"
    static let offset = "offset"
    static let limitBids = "limit_bids"
    static let limitAsks = "limit_asks"
    static let timeStart = "timeStart"
    static let timeEnd = "timeEnd"
    static let type = "type"
    static let amount = "amount"
    static let price = "price"
    static let triggerPrice = "trigger_price"
    static let pairId = "currencyPairId"
    static let orderStatus = "orderStatus"
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
    case oneDay = "1D"
}

public enum OrderType: String, Codable {
    case sell = "SELL"
    case buy = "BUY"
    case stopLimitBuy = "STOP_LIMIT_BUY"
    case stopLimitSell = "STOP_LIMIT_SELL"
}

public enum OrderStatus: String, Codable {
    case all = "ALL"
    case processing = "PROCESSING"
    case pending = "PENDING"
    case finished = "FINISHED"
    case cancelled = "CANCELLED"
}

public enum WalletSortKey: String {
    case balance
    case frozen
    case bonus
    case total
}

public enum DepositStatus: String, Codable {
    case processing = "PROCESSING"
    case awatingApproval = "AWAITING APPROVAL"
    case finished = "FINISHED"
    case canceledByAdmin = "CANCELLED BY ADMIN"
    case depositError = "DEPOSIT ERROR"
    case hold = "HODL"
}

public enum WithdrawalStatus: String, Codable {
    case notConfirmed = "Not Confirmed"
    case cancelledByUser = "Cancelled by User"
    case awatingApproval = "Awaiting Approval"
    case approved = "Approved"
    case processing = "Processing"
    case finished = "Finished"
    case withdrawalError = "Withdrawal Error"
    case cancelledByAdmin = "Cancelled by Admin"
    case awaiting = "Awaiting"
}
