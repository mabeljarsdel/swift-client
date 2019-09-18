//
//  RefreshTokensRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class RefreshTokensRequest: IRequest {
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endpoint: String {
        return StexServerConstants.baseUrl + "refresh_token/" + (StexTokensManager.sharded.refreshToken ?? "")
    }
}
