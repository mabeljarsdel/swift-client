//
//  InsertReferralRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 28.10.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class InsertReferralRequest: IRequest {
    
    private let code: String
    
    init(code: String) {
        self.code = code
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endpoint: String {
        return ProfileEndpoints.referral.path + "/insert/\(code)"
    }
}
