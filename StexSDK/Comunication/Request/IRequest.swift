//
//  IRequest.swift
//  STEX API
//
//  Created by Alexander Rudyk on 6/27/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation
import Alamofire

protocol IRequest {
    
    var httpMethod: HTTPMethod { get }
    var endpoint: String { get }
    var encoding: ParameterEncoding { get }
    
    func httpHeaders() -> HTTPHeaders?
    func parameters() -> Parameters?
    func urlRequest() -> URLRequest?
    
}

extension IRequest {
    
    func httpHeaders() -> HTTPHeaders? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func urlRequest() -> URLRequest? {
        return nil
    }
    
    func parameters() -> Parameters? {
        return nil
    }
}
