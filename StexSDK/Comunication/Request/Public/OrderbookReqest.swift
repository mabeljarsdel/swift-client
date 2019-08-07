//
//  OrderbookReqest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class OrderbookReqest: IRequest {
    
    private var id: Int
    private var limitBids: Int
    private var limitAsks: Int
    
    init(with id: Int, limitBids: Int = 100, limitAsks: Int = 100) {
        self.id = id
        self.limitBids = limitBids
        self.limitAsks = limitAsks
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.orderbook.path + "/\(id)"
    }
    
    func parameters() -> Parameters? {
        return [
            "limit_bids": limitBids,
            "limit_asks": limitAsks
        ]
    }
}
