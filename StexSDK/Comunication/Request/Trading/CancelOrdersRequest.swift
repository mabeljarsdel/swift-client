//
//  CancelOrdersRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CancelOrdersRequest: OrdersRequest {
    
    override var httpMethod: HTTPMethod {
        return .delete
    }
}
