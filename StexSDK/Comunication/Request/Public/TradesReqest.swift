//
//  TradesRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/16/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class TradesRequest: IRequest {
    
    private var sortKey: SortKey
    private var id: Int
    private var from: Double?
    private var till: Double?
    private var limit: Int
    private var offset: Int?
    
    init(with id: Int, sortKey: SortKey = .desc, from: Double?, till: Double?, limit: Int = 100, offset: Int?) {
        self.id = id
        self.sortKey = sortKey
        self.from = from
        self.till = till
        self.limit = limit
        self.offset = offset
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.trades.path + "/\(id)"
    }
    
    func parameters() -> Parameters? {
        var param: Parameters = [
            StexServerConstants.sort: sortKey.rawValue.uppercased(),
            StexServerConstants.limit: limit
        ]
        
        if let from = from {
            param[StexServerConstants.from] = from
        }
        
        if let till = till {
            param[StexServerConstants.till] = till
        }
        
        if let offset = offset {
            param[StexServerConstants.offset] = offset
        }
        
        return param
    }
}
