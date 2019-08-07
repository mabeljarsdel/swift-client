//
//  StexClient.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

public typealias StexClientCompletion<T: Codable> = (StexResult<T>) -> ()

/// Client for STEX API
public class StexClient: APIClient {
    
    //MARK: - Ticker
    
    /// Tickers list for all currency pairs.
    ///
    /// Last 24H information about every currency pair.
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchAllTicker(completion: @escaping StexClientCompletion<[Ticker]>) {
        request(TickerRequest(), completion: completion)
    }
    
    /// Ticker for currency pairs.
    ///
    /// Last 24H information about currency pair.
    ///
    /// - Parameters:
    ///   - id:         Ticker id.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchTicker(with id: Int, completion: @escaping StexClientCompletion<Ticker>) {
        request(TickerRequest(with: id), completion: completion)
    }
    
    //MARK: - Currency
    
    /// Available Currencies.
    ///
    /// Get list of avialable currencies.
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchAllCurrencies(completion: @escaping StexClientCompletion<[Currency]>) {
        request(CurrenciesRequest(), completion: completion)
    }
    
    /// Get currency info
    ///
    /// - Parameters:
    ///   - id:         Currency id.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchCurrency(with id: Int, completion: @escaping StexClientCompletion<Currency>) {
        request(CurrenciesRequest(with: id), completion: completion)
    }
    
    //MARK: - Markets
    
    /// Available markets.
    ///
    /// Get list of all avialable markets.
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchAllMarkets(completion: @escaping StexClientCompletion<[Market]>) {
        request(MarketsReqest(), completion: completion)
    }
    
    //MARK: - Pairs Groups
    
    /// Available currency pairs groups (as displayed at stex trading page).
    ///
    /// Get list of all avialable currency pairs groups.
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchAllPairsGroups(completion: @escaping StexClientCompletion<[PairGroup]>) {
        request(PairsGroupsReqest(), completion: completion)
    }
    
    //MARK: - Currency Pairs
    
    /// Available currency pairs.
    ///
    /// Returns a list of avialable currency pairs in the given market if `code` is one of the values returned by `fetchAllMarkets`.
    /// Returns all available currency pairs if ALL passed as a `code`.
    ///
    /// - Parameters:
    ///   - code: The `String`. Available values: `ALL, BTC`
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchCurrencyPairsList(with code: String = "ALL", completion: @escaping StexClientCompletion<[CurrencyPair]>) {
        request(CurrencyPairsListReqest(with: code), completion: completion)
    }
    
    /// Available currency pairs for a given group.
    ///
    /// Returns a list of avialable currency pairs in the given currency pair group.
    ///
    /// - Parameters:
    ///   - groupId: The `Int`. Group ID.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchCurrencyPairs(with groupId: Int, completion: @escaping StexClientCompletion<[CurrencyPair]>) {
        request(CurrencyPairsGroupRequest(with: groupId), completion: completion)
    }
    
    /// Get currency pair information.
    ///
    /// Returns currency pair information.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchCurrencyPair(with id: Int, completion: @escaping StexClientCompletion<CurrencyPair>) {
        request(CurrencyPairRequest(with: id), completion: completion)
    }
    
    //MARK: - Trades
    
    /// Trades for given currency pair
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    ///   - sortKey: The `SortKey`. Direction of the sort - ASCending (.asc) or DESCending (.desc) by trade timestamp.
    ///   - from: The `Double`. The timestamp in millisecond.
    ///   - till: The `Double`. The timestamp in millisecond.
    ///   - limit: The `Int`. Default value : 100
    ///   - offset: The `Int`
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchTrades(with id: Int, sortKey: SortKey = .desc, from: Double?, till: Double?, limit: Int = 100, offset: Int?, completion: @escaping StexClientCompletion<[Trade]>) {
        
        request(TradesReqest(with: id, sortKey: sortKey, from: from, till: till, limit: limit, offset: offset), completion: completion)
    }
    
    //MARK: - Orderbook
    
    public func fetchOrderbook(with id: Int, limitBids: Int = 100, limitAsks: Int = 100, completion: @escaping StexClientCompletion<Orderbook>) {
        request(OrderbookReqest(with: id, limitBids: limitBids, limitAsks: limitAsks), completion: completion)
    }
}
