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
        request(MarketsRequest(), completion: completion)
    }
    
    //MARK: - Pairs Groups
    
    /// Available currency pairs groups (as displayed at stex trading page).
    ///
    /// Get list of all avialable currency pairs groups.
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchAllPairsGroups(completion: @escaping StexClientCompletion<[PairGroup]>) {
        request(PairsGroupsRequest(), completion: completion)
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
        request(CurrencyPairsListRequest(with: code), completion: completion)
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
    ///   - from: The `Double`. The timestamp in second.
    ///   - till: The `Double`. The timestamp in second.
    ///   - limit: The `Int`. Default value : 100
    ///   - offset: The `Int`
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchTrades(with id: Int,
                            sortKey: SortKey = .desc,
                            from: Double?,
                            till: Double?,
                            limit: Int = 100,
                            offset: Int?,
                            completion: @escaping StexClientCompletion<[Trade]>) {
        
        request(TradesRequest(with: id,
                             sortKey: sortKey,
                             from: from,
                             till: till,
                             limit: limit,
                             offset: offset),
                completion: completion)
    }
    
    //MARK: - Orderbook
    
    /// Orderbook for given currency pair.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    ///   - limitBids: The `Int`. Return only top N bids. Returns all if set to 0.
    ///   - limitAsks: The `Int`. Return only top N asks. Returns all if set to 0.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchOrderbook(with id: Int,
                               limitBids: Int = 100,
                               limitAsks: Int = 100,
                               completion: @escaping StexClientCompletion<Orderbook>) {
        
        request(OrderbookRequest(with: id,
                                limitBids: limitBids,
                                limitAsks: limitAsks),
                completion: completion)
    }
    
    //MARK: - Chart
    
    /// A list of candles for given currency pair.
    ///
    /// Provides a list of candles for the chart. Candles are always ordered in descending order (the latest are first).
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    ///   - candlesType: The `CandlesType`. Candle size oneMinute for 1 minute, fiveMinute - 5 minutes and so on.
    ///   - timeStart: The `Double`. Timestamp in second. Should be less then timeEnd.
    ///   - timeEnd: The `Double`. Timestamp in second. Should be greater then timeStart.
    ///   - limit: The `Int`. Default value : 100.
    ///   - offset: The `Int`.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchChartData(with id: Int,
                               candlesType: CandlesType = .oneDay,
                               timeStart: Double,
                               timeEnd: Double,
                               limit: Int = 100,
                               offset: Int? = nil,
                               completion: @escaping StexClientCompletion<[Candle]>) {
        
        let req = ChartRequest(with: id,
                               candlesType: candlesType,
                               timeStart: timeStart,
                               timeEnd: timeEnd,
                               limit: limit,
                               offset: offset)
        
        request(req, completion: completion)
    }
    
    //MARK: - Profile
    
    /// Account information.
    ///
    /// Get general information about the current user
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchProfileInfo(completion: @escaping StexClientCompletion<User>) {
        request(ProfileInfoRequest(), completion: completion)
    }
    
    //MARK: Wallet
    
    /// Get a list of user wallets.
    ///
    /// - Parameters:
    ///   - sortDirection: The `SortKey`. Default value : `.desc`.
    ///   - sortBy: The `WalletSortKey`. Default value : `.balance`.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchWalletsList(with sortDirection: SortKey? = .desc, sortBy: WalletSortKey? = .balance, completion: @escaping StexClientCompletion<[Wallet]>) {
        request(WalletsRequest(with: sortDirection, sortBy: sortBy), completion: completion)
    }
    
    /// Single wallet information.
    ///
    /// - Parameters:
    ///   - walletId: The `Int`.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchWallet(with walletId: Int, completion: @escaping StexClientCompletion<WalletDetail>) {
        request(WalletsRequest(with: walletId), completion: completion)
    }
    
    /// Create a wallet for given currency
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - completion: A closure to be executed once the request has finished.
    public func createWallet(with pairId: Int, completion: @escaping StexClientCompletion<WalletDetail>) {
        request(CreateWalletRequest(with: pairId), completion: completion)
    }
    
    /// Get deposit address for given wallet
    ///
    /// - Parameters:
    ///   - walletId: The `Int`.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchWalletAddress(with walletId: Int, completion: @escaping StexClientCompletion<DepositAddress>) {
        request(WalletAddressRequest(with: walletId), completion: completion)
    }
    
    /// Create new deposit address
    ///
    /// This method allows to generate deposit address if no address was previously generated. It is also allowed to re-generate new address for some currencies.
    ///
    /// - Parameters:
    ///   - walletId: The `Int`.
    ///   - completion: A closure to be executed once the request has finished.
    public func createWalletAddress(with walletId: Int, completion: @escaping StexClientCompletion<DepositAddress>) {
        request(CreateWalletAddressRequest(with: walletId), completion: completion)
    }
    
    //MARK: - Trading
    
    /// Returns the user's fees for a given currency pair
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchFee(for pairId: Int, completion: @escaping StexClientCompletion<Fee>) {
        request(FeesRequest(pairId: pairId), completion: completion)
    }
    
    //MARK: Orders
    
    /// List of your currently open orders.
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchOrdersList(completion: @escaping StexClientCompletion<[Order]>) {
        request(OrdersRequest(), completion: completion)
    }
    
    /// List of your currently open orders for certain currency pair.
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchOrdersList(with pairId: Int, completion: @escaping StexClientCompletion<[Order]>) {
        request(OrdersRequest(pairId: pairId), completion: completion)
    }
    
    /// Cancel all active orders
    ///
    /// Puts an request to delete all active (processing or pending) orders to orders processing queue.
    ///
    /// - Parameters:
    ///   - completion: A closure to be executed once the request has finished.
    public func cancelOrders(completion: @escaping StexClientCompletion<CanceledOrders>) {
        request(CancelOrdersRequest(), completion: completion)
    }
    
    /// Cancel active orders for given currency pair
    ///
    /// Puts an request to delete all active (processing or pending) of the given currency pair orders to orders processing queue.
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - completion: A closure to be executed once the request has finished.
    public func cancelOrders(with pairId: Int, completion: @escaping StexClientCompletion<CanceledOrders>) {
        request(CancelOrdersRequest(pairId: pairId), completion: completion)
    }
    
    /// Create new order and put it to the orders processing queue
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - type: The `OrderType`. order type.
    ///   - amount: The `Double`.
    ///   - price: The `Double`.
    ///   - triggerPrice: The `Double?`. Stop price for stop-limit orders. Required if the order is of type `.stopLimitBuy` or `.stopLimitSell`.
    ///   - completion: A closure to be executed once the request has finished.
    public func createOrder(with pairId: Int,
                            type: OrderType,
                            amount: Double,
                            price: Double,
                            triggerPrice: Double?,
                            completion: @escaping StexClientCompletion<Order>) {
        
        let req = CreateOrderReqest(pairId: pairId,
                                    type: type,
                                    amount: amount,
                                    price: price,
                                    triggerPrice: triggerPrice)
        
        request(req, completion: completion)
    }
    
    /// Get a single order.
    ///
    /// Get information about the given order.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Order id.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchOrder(with id: Int, completion: @escaping StexClientCompletion<Order>) {
        request(OrderRequest(orderId: id), completion: completion)
    }
    
    /// Cancel order
    ///
    /// - Parameters:
    ///   - id: The `Int`. Order id.
    ///   - completion: A closure to be executed once the request has finished.
    public func cancelOrder(with id: Int, completion: @escaping StexClientCompletion<CanceledOrders>) {
        request(CancelOrderRequest(orderId: id), completion: completion)
    }
    
    //MARK: - Trading History
    
    /// Get past orders.
    ///
    /// Get the list of closed (finished, partial or cancelled) orders.
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - orderStatus: The `OrderStatus`. Default value : `.all`.
    ///   - limit: The `Int`. Default value : `100`.
    ///   - offset: The `Int`.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchTradingHistory(with pairId: Int? = nil,
                                    orderStatus: OrderStatus = .all,
                                    limit: Int = 100,
                                    offset: Int? = nil,
                                    completion: @escaping StexClientCompletion<[Order]>) {
        
        let req = TradingHistoryRequest(pairId: pairId,
                                        orderStatus: orderStatus,
                                        limit: limit,
                                        offset: offset)
        
        request(req, completion: completion)
    }
    
    /// Get specified order details.
    ///
    /// Get trades and fees information for given order.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Order id.
    ///   - completion: A closure to be executed once the request has finished.
    public func fetchTradingHistory(with id: Int, completion: @escaping StexClientCompletion<OrderDetail>) {
        
        let req = TradingHistoryRequest(orderId: id)
        
        request(req, completion: completion)
    }
}
