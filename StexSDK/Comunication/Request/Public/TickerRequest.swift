//
//  TickerRequest.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

/**
    Tickers list for all currency pairs.
    Last 24H information about every currency pair.
*/

public class TickerRequest: IRequest {
    
    private var id: Int?
    
    public init(with currencyPairId: Int? = nil) {
        id = currencyPairId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        var path = PublicEndpoints.ticker.path
        
        path += id == nil ? "" : "/\(id ?? 0)"
        
        return path
    }
}
