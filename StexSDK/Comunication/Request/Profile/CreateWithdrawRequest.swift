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
    private let protocolId: Int?
    private let additionalParameter: String?
    
    init(with currencyId: Int, amount: Double, address: String, protocolId: Int?, additionalParameter: String?) {
        self.currencyId = currencyId
        self.amount = amount
        self.address = address
        self.protocolId = protocolId
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
            StexServerConstants.currencyId: currencyId,
            StexServerConstants.amount: amount,
            StexServerConstants.address: address
        ]
        
        if let additionalParameter = additionalParameter {
            params[StexServerConstants.additionalParameter] = additionalParameter
        }
        
        if let protocolId = protocolId {
            params[StexServerConstants.protocolId] = protocolId
        }
        
        return params
    }
}
