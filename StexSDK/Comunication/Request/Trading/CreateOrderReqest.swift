//
//  CreateOrderReqest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CreateOrderReqest: OrdersRequest {
    
    private let type: OrderType
    private let amount: Double
    private let price: Double
    private let triggerPrice: Double?
    
    required init(pairId: Int, type: OrderType, amount: Double, price: Double, triggerPrice: Double?) {
        self.type = type
        self.amount = amount
        self.price = price
        self.triggerPrice = triggerPrice
        
        super.init(pairId: pairId)
    }
    
    override var httpMethod: HTTPMethod {
        return .post
    }
    
    override func parameters() -> Parameters? {
        var params: Parameters = [
            StexServerConstants.type: type.rawValue,
            StexServerConstants.amount: DoubleFormatter.formatServer(value: amount),
            StexServerConstants.price: DoubleFormatter.formatServer(value: price)
        ]
        
        if let triggerPrice = triggerPrice {
            params[StexServerConstants.triggerPrice] = triggerPrice
        }
        
        return params
    }
}
