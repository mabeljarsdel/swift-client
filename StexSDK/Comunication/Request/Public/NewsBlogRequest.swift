//
//  NewsBlogRequest.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 10.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import Alamofire

class NewsBlogRequest: IRequest {

    var httpMethod: HTTPMethod {
        return .get
    }

    var endpoint: String {
        return PublicEndpoints.newsBlog.rawValue
    }
}
