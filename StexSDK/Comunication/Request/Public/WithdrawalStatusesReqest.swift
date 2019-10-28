//
//  WithdrawalStatusesReqest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 28.10.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class WithdrawalStatusesReqest: IRequest {
    
    private var id: Int?
    
    init(with statusId: Int? = nil) {
        id = statusId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        var path = PublicEndpoints.withdrawalStatuses.path
        
        path += id == nil ? "" : "/\(id ?? 0)"
        
        return path
    }
}
