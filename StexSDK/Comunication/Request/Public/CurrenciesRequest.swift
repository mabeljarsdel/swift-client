//
//  CurrenciesRequest.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

/**
 Available Currencies.
 Get list of avialable currencies.
 */

class CurrenciesRequest: IRequest {
    
    private var id: Int?
    
    init(with currencyId: Int? = nil) {
        id = currencyId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        var path = PublicEndpoints.currencies.path
        
        path += id == nil ? "" : "/\(id ?? 0)"
        
        return path
    }
}
