//
//  CreateWalletAddressRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class CreateWalletAddressRequest: WalletAddressRequest {
    
    override var httpMethod: HTTPMethod {
        return .post
    }
}
