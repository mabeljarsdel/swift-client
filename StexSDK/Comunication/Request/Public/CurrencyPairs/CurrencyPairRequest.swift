//
//  CurrencyPairRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CurrencyPairRequest: IRequest {
    
    private var id: Int
    
    init(with id: Int) {
        self.id = id
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.currencyPairs.path + "/\(id)?return_single_object=1"
    }
}
