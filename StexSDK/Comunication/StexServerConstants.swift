//
//  StexServerConstants.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

typealias PublicEndpoints = StexServerConstants.Endpoints.Public
typealias ProfileEndpoints = StexServerConstants.Endpoints.Profile
typealias TradingEndpoints = StexServerConstants.Endpoints.Trading
typealias TradingHistoryEndpoints = StexServerConstants.Endpoints.TradingHistory
typealias SettingsEndpoints = StexServerConstants.Endpoints.Settings

public struct StexServerConstants {
    
    static let baseUrl = "https://api3.stex.com/"
    
    struct Endpoints {
        private static let `public` = "public/"
        private static let profile = "profile/"
        private static let trading = "trading/"
        private static let tradingHistory = "reports/"
        private static let settings = "settings/"
        
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
            case depositStatuses = "deposit-statuses"
            case withdrawalStatuses = "withdrawal-statuses"
            
            var path: String {
                return StexServerConstants.baseUrl + Endpoints.public + rawValue
            }
        }
        
        enum Profile: String {
            case info
            case wallets
            case deposits
            case withdrawals
            case withdraw
            
            var path: String {
                return StexServerConstants.baseUrl + Endpoints.profile + rawValue
            }
        }
        
        enum Trading: String {
            case fees
            case orders
            case order
            
            var path: String {
                return StexServerConstants.baseUrl + Endpoints.trading + rawValue
            }
        }
        
        enum TradingHistory: String {
            case orders
            case trades
            
            var path: String {
                return StexServerConstants.baseUrl + Endpoints.tradingHistory + rawValue
            }
        }
        
        enum Settings: String {
            case notifications
            
            var path: String {
                return StexServerConstants.baseUrl + Endpoints.settings + rawValue
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
    static let currencyId = "currency_id"
    static let address = "address"
    static let additionalParameter = "additional_address_parameter"
    static let event = "event"
    static let channel = "channel"
    static let value = "value"
}

public enum SortKey: String {
    case desc
    case asc
}

public enum StexTradeType: String, Codable {
    case sell = "SELL"
    case buy = "BUY"
    case stopLimitBuy = "BUY (STOP-LIMIT)"
    case stopLimitSell = "SELL (STOP-LIMIT)"
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

public enum StexOrderType: String, Codable {
    case buy = "BUY"
    case sell = "SELL"
    case stopLimitBuy = "BUY (STOP-LIMIT)"
    case stopLimitSell = "SELL (STOP-LIMIT)"
}

public enum StexOrderStatus: String, Codable {
    case all = "ALL"
    case pending = "PENDING"
    case processing = "PROCESSING"
    case finished = "FINISHED"
    case cancelled = "CANCELLED"
    case partial = "PARTIAL"
    case withTrades = "WITH_TRADES"
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
