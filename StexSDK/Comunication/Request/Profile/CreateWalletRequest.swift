//
//  CreateWalletRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CreateWalletRequest: IRequest {
    
    let pairId: Int
    
    init(with pairId: Int) {
        self.pairId = pairId
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endpoint: String {
        return ProfileEndpoints.wallets.path + "/\(pairId)"
    }
}
