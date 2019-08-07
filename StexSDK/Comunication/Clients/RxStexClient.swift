//
//  RxStexClient.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation
import RxSwift

public extension RxStexClient {
    
    //MARK: - Ticker
    
    /// Tickers list for all currency pairs.
    ///
    /// Last 24H information about every currency pair.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllTicker() -> Observable<[Ticker]> {
        return request(TickerRequest())
    }
    
    /// Ticker for currency pairs.
    ///
    /// Last 24H information about currency pair.
    ///
    /// - Parameters:
    ///   - id:         Ticker id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchTiker(with id: Int) -> Observable<Ticker> {
        return request(TickerRequest(with: id))
    }
    
    //MARK: - Currency
    
    /// Available Currencies.
    ///
    /// Get list of avialable currencies.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllCurrencies() -> Observable<[Currency]> {
        return request(CurrenciesRequest())
    }
    
    /// Get currency info
    ///
    /// - Parameters:
    ///   - id:         Currency id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchCurrency(with id: Int) -> Observable<Currency> {
        return request(CurrenciesRequest(with: id))
    }
    
    //MARK: - Markets
    
    /// Available markets.
    ///
    /// Get list of all avialable markets.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllMarkets() -> Observable<[Market]> {
        return request(MarketsReqest())
    }
    
    //MARK: - Pairs Groups
    
    /// Available currency pairs groups (as displayed at stex trading page).
    ///
    /// Get list of all avialable currency pairs groups.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllPairsGroups() -> Observable<[PairGroup]> {
        return request(PairsGroupsReqest())
    }
    
    //MARK: - Currency Pairs
    
    /// Available currency pairs.
    ///
    /// Returns a list of avialable currency pairs in the given market if `code` is one of the values returned by `fetchAllMarkets`.
    /// Returns all available currency pairs if ALL passed as a `code`.
    ///
    /// - Parameters:
    ///   - code: The `String`. Available values: `ALL, BTC`
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchCurrencyPairsList(with code: String = "ALL") -> Observable<[CurrencyPair]> {
        return request(CurrencyPairsListReqest(with: code))
    }
    
    /// Available currency pairs for a given group.
    ///
    /// Returns a list of avialable currency pairs in the given currency pair group.
    ///
    /// - Parameters:
    ///   - groupId: The `Int`. Group ID.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchCurrencyPairs(with groupId: Int) -> Observable<[CurrencyPair]> {
        return request(CurrencyPairsGroupRequest(with: groupId))
    }
    
    /// Get currency pair information.
    ///
    /// Returns currency pair information.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchCurrencyPair(with id: Int) -> Observable<CurrencyPair> {
        return request(CurrencyPairRequest(with: id))
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
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchTrades(with id: Int, sortKey: SortKey = .desc, from: Double?, till: Double?, limit: Int = 100, offset: Int?) -> Observable<[Trade]> {
        
        return request(TradesReqest(with: id, sortKey: sortKey, from: from, till: till, limit: limit, offset: offset))
    }
}

//MARK: -
/// RX Client for STEX API
public class RxStexClient: APIClient {
    
    //MARK: - Private
    private func request<T: Codable> (_ req: IRequest) -> Observable<T> {
        return Observable<T>.create { [weak self] observer in
            let request = self?.request(req, completion: { (result: StexResult<T>) in
                switch result {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                case .error(let error):
                    observer.onError(error)
                }
            })
            
            return Disposables.create {
                request?.cancel()
            }
        }
    }
}
