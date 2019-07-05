//
//  RxStexClient.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation
import RxSwift

public class RxStexClient: APIClient {
    
    //MARK: - Ticker
    
    /**
     Tickers list for all currency pairs.
     Last 24H information about every currency pair.
     */
    public func fetchAllTicker() -> Observable<[Ticker]> {
        return request(TickerRequest())
    }
    
    /**
     Ticker for currency pairs.
     Last 24H information about currency pair.
     */
    public func fetchTiker(with id: Int) -> Observable<Ticker> {
        return request(TickerRequest(with: id))
    }
    
    //MARK: - Currency
    
    /**
     Available Currencies.
     Get list of avialable currencies.
     */
    public func fetchAllCurrencies() -> Observable<[Currency]> {
        return request(CurrenciesRequest())
    }
    
    /**
     Get currency info
     */
    public func fetchCurrency(with id: Int) -> Observable<Currency> {
        return request(CurrenciesRequest(with: id))
    }
    
    //MARK: - Markets
    
    /**
     Available markets.
     Get list of all avialable markets.
     */
    public func fetchAllMarkets() -> Observable<[Market]> {
        return request(MarketsReqest())
    }
    
    //MARK: - Pairs Groups
    
    /**
     Available currency pairs groups (as displayed at stex trading page).
     Get list of all avialable currency pairs groups.
     */
    public func fetchAllPairsGroups() -> Observable<[PairGroup]> {
        return request(PairsGroupsReqest())
    }
    
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
