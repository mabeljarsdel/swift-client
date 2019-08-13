//
//  ProfileInfoRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class ProfileInfoRequest: IRequest {
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return ProfileEndpoints.info.path
    }
}
