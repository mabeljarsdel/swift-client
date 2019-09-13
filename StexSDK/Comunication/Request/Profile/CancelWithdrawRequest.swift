//
//  CancelWithdrawRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CancelWithdrawRequest: IRequest {
    
    private let id: Int
    
    init(with withdrawalId: Int) {
        id = withdrawalId
    }
    
    var httpMethod: HTTPMethod {
        return .delete
    }
    
    var endpoint: String {
        return ProfileEndpoints.withdraw.path + "/\(id)"
    }
}
