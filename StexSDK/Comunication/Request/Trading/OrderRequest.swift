//
//  OrderRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class OrderRequest: IRequest {
    
    let orderId: Int
    
    init(orderId: Int) {
        self.orderId = orderId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return TradingEndpoints.order.path + "/\(orderId)"
    }
}
