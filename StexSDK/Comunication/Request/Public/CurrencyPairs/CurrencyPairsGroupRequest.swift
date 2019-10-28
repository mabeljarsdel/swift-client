//
//  CurrencyPairsGroupRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CurrencyPairsGroupRequest: IRequest {
    
    private var groupId: Int
    
    init(with id: Int) {
        groupId = id
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.currencyPairs.path + "/group/\(groupId)"
    }
}
