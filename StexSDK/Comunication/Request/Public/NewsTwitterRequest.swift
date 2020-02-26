//
//  NewsTwitterRequest.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 26.02.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import Alamofire

class NewsTwitterRequest: IRequest {

    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.newsTwitter.path
    }
}
