//
//  CreateWithdrawRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CreateWithdrawRequest: IRequest {
    
    private let currencyId: Int
    private let amount: Double
    private let address: String
    private let additionalParameter: String?
    
    init(with currencyId: Int, amount: Double, address: String, additionalParameter: String?) {
        self.currencyId = currencyId
        self.amount = amount
        self.address = address
        self.additionalParameter = additionalParameter
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endpoint: String {
        return ProfileEndpoints.withdraw.path
    }
    
    func parameters() -> Parameters? {
        var params: Parameters = [
            ServerConstants.currencyId: currencyId,
            ServerConstants.amount: amount,
            ServerConstants.address: address
        ]
        
        if let additionalParameter = additionalParameter {
            params[ServerConstants.additionalParameter] = additionalParameter
        }
        
        return params
    }
}
