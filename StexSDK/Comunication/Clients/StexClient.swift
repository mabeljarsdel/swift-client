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
    public func fetchCurrencyPairsList(with code: String = "ALL", completion: @escaping StexClientCompletion<[CyrrencyPair]>) {
        request(CurrencyPairsListReqest(with: code), completion: completion)
    }
}
