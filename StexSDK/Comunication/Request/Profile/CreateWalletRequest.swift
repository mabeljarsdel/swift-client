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
    let protocolId: Int?
    
    init(with pairId: Int, protocolId: Int? = nil) {
        self.pairId = pairId
        self.protocolId = protocolId
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endpoint: String {
        return ProfileEndpoints.wallets.path + "/\(pairId)"
    }
    
    func parameters() -> Parameters? {
        guard let protocolId = protocolId else { return [:] }
        
        return [
            StexServerConstants.protocolId: protocolId
        ]
    }
}
