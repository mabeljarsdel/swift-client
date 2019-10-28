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
    func fetchAllTicker() -> Observable<[StexTicker]> {
        return request(TickerRequest())
    }
    
    /// Ticker for currency pairs.
    ///
    /// Last 24H information about currency pair.
    ///
    /// - Parameters:
    ///   - id:         Ticker id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchTiker(with id: Int) -> Observable<StexTicker> {
        return request(TickerRequest(with: id))
    }
    
    //MARK: - Currency
    
    /// Available Currencies.
    ///
    /// Get list of avialable currencies.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllCurrencies() -> Observable<[StexCurrency]> {
        return request(CurrenciesRequest())
    }
    
    /// Get currency info
    ///
    /// - Parameters:
    ///   - id:         Currency id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchCurrency(with id: Int) -> Observable<StexCurrency> {
        return request(CurrenciesRequest(with: id))
    }
    
    //MARK: - Markets
    
    /// Available markets.
    ///
    /// Get list of all avialable markets.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllMarkets() -> Observable<[StexMarket]> {
        return request(MarketsRequest())
    }
    
    //MARK: - Pairs Groups
    
    /// Available currency pairs groups (as displayed at stex trading page).
    ///
    /// Get list of all avialable currency pairs groups.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchAllPairsGroups() -> Observable<[StexPairGroup]> {
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
    func fetchCurrencyPairsList(with code: String = "ALL") -> Observable<[StexCurrencyPair]> {
        return request(CurrencyPairsListRequest(with: code))
    }
    
    /// Available currency pairs for a given group.
    ///
    /// Returns a list of avialable currency pairs in the given currency pair group.
    ///
    /// - Parameters:
    ///   - groupId: The `Int`. Group ID.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchCurrencyPairs(with groupId: Int) -> Observable<[StexCurrencyPair]> {
        return request(CurrencyPairsGroupRequest(with: groupId))
    }
    
    /// Get currency pair information.
    ///
    /// Returns currency pair information.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchCurrencyPair(with id: Int) -> Observable<StexCurrencyPair> {
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
    func fetchTrades(with id: Int, sortKey: SortKey = .desc, from: Double?, till: Double?, limit: Int = 100, offset: Int?) -> Observable<[StexTrade]> {
        
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
                               limitAsks: Int = 100) -> Observable<StexOrderbook> {
        
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
                               offset: Int? = nil) -> Observable<[StexCandle]> {
        
        let req = ChartRequest(with: id,
                               candlesType: candlesType,
                               timeStart: timeStart,
                               timeEnd: timeEnd,
                               limit: limit,
                               offset: offset)
        
        return request(req)
    }
    
    //MARK: - Deposit statuses
    
    /// Available Deposit Statuses.
    ///
    /// Get list of avialable deposit statuses.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchDepositStatuses() -> Observable<[StexDepositStatus]> {
        return request(DepositStatusesReqest())
    }
    
    /// Get deposit status info
    ///
    /// - Parameters:
    ///   - statusId: Status id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchDepositStatus(statusId: Int) -> Observable<StexDepositStatus> {
        return request(DepositStatusesReqest(with: statusId))
    }
    
    //MARK: - Withdrawal statuses
    
    /// Available Withdrawal Statuses.
    ///
    /// Get list of avialable withdrawal statuses.
    ///
    /// - Parameters:
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchWithdrawalStatuses() -> Observable<[StexWithdrawalStatus]> {
        return request(WithdrawalStatusesReqest())
    }
    
    /// Get withdrawal status info
    ///
    /// - Parameters:
    ///   - statusId: Status id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchWithdrawalStatus(statusId: Int) -> Observable<StexWithdrawalStatus> {
        return request(WithdrawalStatusesReqest(with: statusId))
    }
    
    //MARK: - Profile
    
    /// Account information.
    ///
    /// Get general information about the current user
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchProfileInfo() -> Observable<StexUser> {
        return request(ProfileInfoRequest())
    }
    
    //MARK: Wallet
    
    /// Get a list of user wallets.
    ///
    /// - Parameters:
    ///   - sortDirection: The `SortKey`. Default value : `.desc`.
    ///   - sortBy: The `WalletSortKey`. Default value : `.balance`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchWalletsList(with sortDirection: SortKey? = .desc, sortBy: WalletSortKey? = .balance) -> Observable<[StexWallet]> {
        return request(WalletsRequest(with: sortDirection, sortBy: sortBy))
    }
    
    /// Single wallet information.
    ///
    /// - Parameters:
    ///   - walletId: The `Int`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchWallet(with walletId: Int) -> Observable<StexWalletDetail> {
        return request(WalletsRequest(with: walletId))
    }
    
    /// Create a wallet for given currency
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    ///   - protocolId: The `Int`. Default value : The value that represents legacy protocol (in case of USDT it is 10 as Tether OMNI was default before multi-currency approach used). The list of values can be obtained from the /public/currencies/{currencyId} endpoint that returns the list of all available protocols for a given currency
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func createWallet(with pairId: Int, protocolId: Int? = nil) -> Observable<StexWalletDetail> {
        return request(CreateWalletRequest(with: pairId, protocolId: protocolId))
    }
    
    /// Get deposit address for given wallet
    ///
    /// - Parameters:
    ///   - walletId: The `Int`.
    ///   - protocolId: The `Int`. Default value : The value that represents legacy protocol (in case of USDT it is 10 as Tether OMNI was default before multi-currency approach used). The list of values can be obtained from the /public/currencies/{currencyId} endpoint that returns the list of all available protocols for a given currency
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchWalletAddress(with walletId: Int, protocolId: Int? = nil) -> Observable<StexDepositAddress> {
        return request(WalletAddressRequest(with: walletId, protocolId: protocolId))
    }
    
    /// Create new deposit address
    ///
    /// This method allows to generate deposit address if no address was previously generated. It is also allowed to re-generate new address for some currencies.
    ///
    /// - Parameters:
    ///   - walletId: The `Int`.
    ///   - protocolId: The `Int`. Default value : The value that represents legacy protocol (in case of USDT it is 10 as Tether OMNI was default before multi-currency approach used). The list of values can be obtained from the /public/currencies/{currencyId} endpoint that returns the list of all available protocols for a given currency
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func createWalletAddress(with walletId: Int, protocolId: Int? = nil) -> Observable<StexDepositAddress> {
        return request(CreateWalletAddressRequest(with: walletId, protocolId: protocolId))
    }
    
    //MARK: Deposits
    
    /// Get a list of deposits made by user.
    ///
    /// Returns a list of deposits the user has made to the exchange according to the filters and parameters passed in the request. Allows to filter deposits by currency, date range etc.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    ///   - sortKey: The `SortKey`. Direction of the sort - ASCending (.asc) or DESCending (.desc) by trade timestamp.
    ///   - timeStart: The `Double`. Timestamp in second. Should be less then timeEnd.
    ///   - timeEnd: The `Double`. Timestamp in second. Should be greater then timeStart.
    ///   - limit: The `Int`. Default value : 100.
    ///   - offset: The `Int`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchDepositsList(with pairId: Int? = nil,
                                  sort: SortKey? = .desc,
                                  timeStart: Double? = nil,
                                  timeEnd: Double? = nil,
                                  limit: Int? = 100,
                                  offset: Int? = nil) -> Observable<[StexDeposit]> {
        
        let req = DepositRequest(with: pairId,
                                 sort: sort,
                                 timeStart: timeStart,
                                 timeEnd: timeEnd,
                                 limit: limit,
                                 offset: offset)
        
        return request(req)
    }
    
    /// Get deposit by id
    ///
    /// - Parameters:
    ///   - id: The `Int`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchDeposit(with depositId: Int) -> Observable<StexDeposit> {
        return request(DepositRequest(with: depositId))
    }
    
    //MARK: Withdrawals
    
    /// Get a list of withdrawals made by user.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Currency pair id.
    ///   - sortKey: The `SortKey`. Direction of the sort - ASCending (.asc) or DESCending (.desc) by trade timestamp.
    ///   - timeStart: The `Double`. Timestamp in second. Should be less then timeEnd.
    ///   - timeEnd: The `Double`. Timestamp in second. Should be greater then timeStart.
    ///   - limit: The `Int`. Default value : 100.
    ///   - offset: The `Int`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchWithdrawalsList(with pairId: Int? = nil,
                                     sort: SortKey? = .desc,
                                     timeStart: Double? = nil,
                                     timeEnd: Double? = nil,
                                     limit: Int? = 100,
                                     offset: Int? = nil) -> Observable<[StexWithdrawal]> {
        
        let req = WithdrawalsRequest(with: pairId,
                                     sort: sort,
                                     timeStart: timeStart,
                                     timeEnd: timeEnd,
                                     limit: limit,
                                     offset: offset)
        
        return request(req)
    }
    
    /// Get withdrawal by id.
    ///
    /// - Parameters:
    ///   - withdrawalId: The `Int`.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchWithdrawal(with withdrawalId: Int) -> Observable<StexWithdrawal> {
        return request(WithdrawalsRequest(with: withdrawalId))
    }
    
    //MARK: Withdraw
    
    /// Create withdrawal request.
    ///
    /// - Parameters:
    ///   - currencyId: The `Int`. Currency id.
    ///   - amount: The `Double`.
    ///   - address: The `String`. Address to send currency.
    ///   - protocolId: The `Int`. This optional parameter has to be used only for multicurrency wallets (for example for USDT). The list of possible values can be obtained in wallet address for such a currency
    ///   - additionalParameter: The `String?`. If withdrawal address requires the payment ID or some key or destination tag etc pass it here.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func createWithdraw(with currencyId: Int,
                               amount: Double,
                               address: String,
                               protocolId: Int?,
                               additionalParameter: String?) -> Observable<StexWithdrawal> {
        
        let req = CreateWithdrawRequest(with: currencyId,
                                        amount: amount,
                                        address: address,
                                        protocolId: protocolId,
                                        additionalParameter: additionalParameter)
        
        return request(req)
    }
    
    /// Cancel unconfirmed withdrawal
    ///
    /// - Parameters:
    ///   - withdrawalId: The `Int`. Withdrawal id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func cancelWithdraw(with withdrawalId: Int) -> Observable<StexWithdrawal> {
        return request(CancelWithdrawRequest(with: withdrawalId))
    }
    
    //MARK: Referral
    
    /// Create referral program
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func createReferral() -> Observable<StexReferral> {
        return request(CreateReferralRequest())
    }
    
    /// Insert referral code
    ///
    /// Insert referral code your friend provided to you
    ///
    /// - Parameters:
    ///   - code: Referral code.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func insertReferral(code: String) -> Observable<StexReferral> {
        return request(InsertReferralRequest(code: code))
    }
    
    //MARK: - Trading
    
    /// Returns the user's fees for a given currency pair
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchFee(for pairId: Int) -> Observable<StexFee> {
        return request(FeesRequest(pairId: pairId))
    }
    
    //MARK: Orders
    
    /// List of your currently open orders.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchOrdersList(limit: Int = 100, offset: Int? = nil) -> Observable<[StexOrder]> {
        return request(ActiveOrdersRequest(limit: limit, offset: offset))
    }
    
    /// List of your currently open orders for certain currency pair.
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchOrdersList(with pairId: Int, limit: Int = 100, offset: Int? = nil) -> Observable<[StexOrder]> {
        return request(ActiveOrdersRequest(pairId: pairId, limit: limit, offset: offset))
    }
    
    /// Cancel all active orders
    ///
    /// Puts an request to delete all active (processing or pending) orders to orders processing queue.
    ///
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func cancelOrders() -> Observable<StexCanceledOrders> {
        return request(CancelOrdersRequest())
    }
    
    /// Cancel active orders for given currency pair
    ///
    /// Puts an request to delete all active (processing or pending) of the given currency pair orders to orders processing queue.
    ///
    /// - Parameters:
    ///   - pairId: The `Int`. Currency pair id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func cancelOrders(with pairId: Int) -> Observable<StexCanceledOrders> {
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
                            type: StexOrderType,
                            amount: Double,
                            price: Double,
                            triggerPrice: Double?) -> Observable<StexOrder> {
        
        let req = CreateOrderReqest(pairId: pairId,
                                    type: type,
                                    amount: amount,
                                    price: price,
                                    triggerPrice: triggerPrice)
        
        return request(req)
    }
    
    /// Get a single order.
    ///
    /// Get information about the given order.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Order id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchOrder(with id: Int) -> Observable<StexOrder> {
        return request(OrderRequest(orderId: id))
    }
    
    /// Cancel order
    ///
    /// - Parameters:
    ///   - id: The `Int`. Order id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func cancelOrder(with id: Int) -> Observable<StexCanceledOrders> {
        return request(CancelOrderRequest(orderId: id))
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
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchTradingHistory(with pairId: Int? = nil,
                                    orderStatus: StexOrderStatus = .all,
                                    limit: Int = 100,
                                    offset: Int? = nil) -> Observable<[StexOrder]> {
        
        let req = TradingHistoryRequest(pairId: pairId,
                                        orderStatus: orderStatus,
                                        limit: limit,
                                        offset: offset)
        
        return request(req)
    }
    
    /// Get specified order details.
    ///
    /// Get trades and fees information for given order.
    ///
    /// - Parameters:
    ///   - id: The `Int`. Order id.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchTradingHistory(with id: Int) -> Observable<StexOrderDetail> {
        let req = TradingHistoryRequest(orderId: id)
        
        return request(req)
    }
    
    //MARK: - Settings
    
    //MARK: Notification
    
    /// User event notification settings
    ///
    /// Provides a list of notifications the user is subscribed to and the channels these notifications are delivered through
    ///
    /// - Parameters:
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchNotificationsSettingsList() -> Observable<[StexNotification]> {
        return request(NotificationsRequest())
    }
    
    /// User event notification settings
    ///
    /// Provides a list of notifications the user is subscribed to and the channels these notifications are delivered through
    ///
    /// - Parameters:
    ///   - event: An event name you want to check the subscription status of.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func fetchNotificationSettings(with event: String) -> Observable<StexNotification> {
        return request(NotificationsRequest(with: event))
    }
    
    /// Set notification settings
    ///
    /// Enable or disable notifications in specific channel for the user
    ///
    /// - Parameters:
    ///   - params: Params for update settings.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func updateNotificationSettings(with params: NotificationParameters) -> Observable<StexNotification> {
        return request(UpdateNotificationSettingsRequest(with: params))
    }
    
    /// Set notification settings
    ///
    /// Enable or disable notifications in many channels for the user at one request
    ///
    /// - Parameters:
    ///   - params: Array params for update settings.
    /// - Returns: The observable sequence with the specified implementation for the `subscribe` method.
    func updateNotificationsSettings(with params: [NotificationParameters]) -> Observable<[StexNotification]> {
        return request(UpdateNotificationSettingsRequest(with: params))
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
