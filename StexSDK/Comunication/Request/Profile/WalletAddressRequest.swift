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
    let protocolId: Int?
    
    init(with id: Int, protocolId: Int? = nil) {
        self.id = id
        self.protocolId = protocolId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return ProfileEndpoints.wallets.path + StexServerConstants.Endpoints.address + "/\(id)"
    }
    
    func parameters() -> Parameters? {
        guard let protocolId = protocolId else { return [:] }
        
        return [
            StexServerConstants.protocolId: protocolId
        ]
    }
}
