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
        return request(MarketsRequest())
    }
    
    //MARK: - Pairs Groups
    
    /// Available currency pairs groups (as displayed at stex trading page).
    ///
    /// Get list of all avialable currency pairs groups.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllPairsGroups() -> Observable<[PairGroup]> {
        return request(PairsGroupsRequest())
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
        return request(CurrencyPairsListRequest(with: code))
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
        
        return request(TradesRequest(with: id, sortKey: sortKey, from: from, till: till, limit: limit, offset: offset))
    }
    
    //MARK: - Orderbook
    
    /// Orderbook for given currency pair.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    ///   - limitBids: The `Int`. Return only top N bids. Returns all if set to 0.
    ///   - limitAsks: The `Int`. Return only top N asks. Returns all if set to 0.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchOrderbook(with id: Int,
                               limitBids: Int = 100,
                               limitAsks: Int = 100) -> Observable<Orderbook> {
        
        return request(OrderbookRequest(with: id,
                                limitBids: limitBids,
                                limitAsks: limitAsks))
    }
    
    //MARK: - Chart
    
    /// A list of candles for given currency pair.
    ///
    /// Provides a list of candles for the chart. Candles are always ordered in descending order (the latest are first).
    ///
    ///   - id: The `Int`. Currency pair id.
    ///   - candlesType: The `CandlesType`. Candle size oneMinute for 1 minute, fiveMinute - 5 minutes and so on.
    ///   - timeStart: The `Double`. Timestamp in second. Should be less then timeEnd.
    ///   - timeEnd: The `Double`. Timestamp in second. Should be greater then timeStart.
    ///   - limit: The `Int`. Default value : 100.
    ///   - offset: The `Int`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchChartData(with id: Int,
                               candlesType: CandlesType = .oneDay,
                               timeStart: Double,
                               timeEnd: Double,
                               limit: Int = 100,
                               offset: Int? = nil) -> Observable<[Candle]> {
        
        let req = ChartRequest(with: id,
                               candlesType: candlesType,
                               timeStart: timeStart,
                               timeEnd: timeEnd,
                               limit: limit,
                               offset: offset)
        
        return request(req)
    }
    
    //MARK: - Profile
    
    /// Account information.
    ///
    /// Get general information about the current user
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchProfileInfo() -> Observable<User> {
        return request(ProfileInfoRequest())
    }
    
    //MARK: - Trading
    
    /// Returns the user's fees for a given currency pair
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchFee(for pairId: Int) -> Observable<Fee> {
        return request(FeesRequest(pairId: pairId))
    }
    
    //MARK: Orders
    
    /// List of your currently open orders.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchOrdersList() -> Observable<[Order]> {
        return request(OrdersRequest())
    }
    
    /// List of your currently open orders for certain currency pair.
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchOrdersList(with pairId: Int) -> Observable<[Order]> {
        return request(OrdersRequest(pairId: pairId))
    }
    
    /// Cancel all active orders
    ///
    /// Puts an request to delete all active (processing or pending) orders to orders processing queue.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func cancelOrders() -> Observable<CanceledOrders> {
        return request(CancelOrdersRequest())
    }
    
    /// Cancel active orders for given currency pair
    ///
    /// Puts an request to delete all active (processing or pending) of the given currency pair orders to orders processing queue.
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func cancelOrders(with pairId: Int) -> Observable<CanceledOrders> {
        return request(CancelOrdersRequest(pairId: pairId))
    }
    
    /// Create new order and put it to the orders processing queue
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - type: The `OrderType`. order type.
    ///   - amount: The `Double`.
    ///   - price: The `Double`.
    ///   - triggerPrice: The `Double?`. Stop price for stop-limit orders. Required if the order is of type `.stopLimitBuy` or `.stopLimitSell`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func createOrder(with pairId: Int,
                            type: OrderType,
                            amount: Double,
                            price: Double,
                            triggerPrice: Double?) -> Observable<Order> {
        
        let req = CreateOrderReqest(pairId: pairId,
                                    type: type,
                                    amount: amount,
                                    price: price,
                                    triggerPrice: triggerPrice)
        
        return request(req)
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
