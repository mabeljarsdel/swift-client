//
//  FeesRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class FeesRequest: IRequest {
    
    private let pairId: Int
    
    init(pairId: Int) {
        self.pairId = pairId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return TradingEndpoints.fees.path + "/\(pairId)"
    }
}
