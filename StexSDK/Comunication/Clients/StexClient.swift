//
//  StexClient.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

public typealias StexClientCompletion<T: Codable> = (StexResult<T>) -> ()

public class StexClient: APIClient {
    
    //MARK: - Ticker
    
    /**
     Tickers list for all currency pairs.
     Last 24H information about every currency pair.
     */
    public func fetchAllTicker(completion: @escaping StexClientCompletion<[Ticker]>) {
        request(TickerRequest(), completion: completion)
    }
    
    /**
     Ticker for currency pairs.
     Last 24H information about currency pair.
     */
    public func fetchTicker(with id: Int, completion: @escaping StexClientCompletion<Ticker>) {
        request(TickerRequest(with: id), completion: completion)
    }
    
    //MARK: - Currency
    
    /**
     Available Currencies.
     Get list of avialable currencies.
     */
    public func fetchAllCurrencies(completion: @escaping StexClientCompletion<[Currency]>) {
        request(CurrenciesRequest(), completion: completion)
    }
    
    /**
     Get currency info
     */
    public func fetchCurrency(with id: Int, completion: @escaping StexClientCompletion<Currency>) {
        request(CurrenciesRequest(with: id), completion: completion)
    }
}
