//
//  CurrencyPairsListReqest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CurrencyPairsListReqest: IRequest {
    
    private var code: String
    
    init(with code: String = "ALL") {
        self.code = code
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        let url = PublicEndpoints.currencyPairs.path + "/list/" + code
        
        return url
    }
}
