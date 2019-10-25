//
//  ActiveOrdersRequest.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 25.10.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation
import Alamofire

class ActiveOrdersRequest: OrdersRequest {
    
    private let limit: Int?
    private let offset: Int?
    
    init(pairId: Int? = nil, limit: Int = 100, offset: Int? = nil) {
        self.limit = limit
        self.offset = offset
        
        super.init(pairId: pairId)
    }
    
    override func parameters() -> Parameters? {
        
        var param: Parameters = [:]
        
        if let limit = limit {
            param[StexServerConstants.limit] = limit
        }
        
        if let offset = offset {
            param[StexServerConstants.offset] = offset
        }
        
        return param
    }
}
