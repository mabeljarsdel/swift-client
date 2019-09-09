//
//  OrdersRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class OrdersRequest: IRequest {
    
    private let pairId: Int?
    
    init(pairId: Int? = nil) {
        self.pairId = pairId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        var path = TradingEndpoints.orders.path
        
        path += pairId == nil ? "" : "/\(pairId!)"
        
        return path
    }
    
    func parameters() -> Parameters? {
        return nil
    }
}
