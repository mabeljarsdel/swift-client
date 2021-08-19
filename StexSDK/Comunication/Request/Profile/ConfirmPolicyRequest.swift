//
//  ConfirmPolicyRequest.swift
//  StexSDK
//
//  Created by Vasyl on 19.08.2021.
//  Copyright © 2021 beleven. All rights reserved.
//

import Foundation
import Alamofire

class ConfirmPolicyRequest: IRequest {
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endpoint: String {
        return ProfileEndpoints.confirmation.path + "/no-kyc-terms"
    }
}
