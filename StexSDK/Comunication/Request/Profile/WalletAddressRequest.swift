//
//  WalletAddressRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class WalletAddressRequest: IRequest {
    
    private let id: Int
    
    init(with id: Int) {
        self.id = id
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return ProfileEndpoints.wallets.path + StexServerConstants.Endpoints.address + "/\(id)"
    }
}
