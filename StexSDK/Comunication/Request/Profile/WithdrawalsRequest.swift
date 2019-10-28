//
//  WithdrawalsRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class WithdrawalsRequest: IRequest {
    
    private let id: Int?
    
    private let pairId: Int?
    private let sort: SortKey?
    private let timeStart: Double?
    private let timeEnd: Double?
    private let limit: Int?
    private let offset: Int?
    
    init(with pairId: Int? = nil, sort: SortKey? = .desc, timeStart: Double? = nil, timeEnd: Double? = nil, limit: Int? = 100, offset: Int? = nil) {
        self.pairId = pairId
        self.sort = sort
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.limit = limit
        self.offset = offset
        
        id = nil
    }
    
    init(with id: Int) {
        self.id = id
        
        pairId = nil
        sort = nil
        timeStart = nil
        timeEnd = nil
        limit = nil
        offset = nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        var path = ProfileEndpoints.withdrawals.path
        
        path += id == nil ? "" : "/\(id!)"
        
        return path
    }
    
    func parameters() -> Parameters? {
        guard id == nil else { return nil }
        
        var param: Parameters = [:]
        
        if let pairId = pairId {
            param[StexServerConstants.pairId] = pairId
        }
        
        if let sort = sort {
            param[StexServerConstants.sort] = sort.rawValue
        }
        
        if let timeStart = timeStart {
            param[StexServerConstants.timeStart] = timeStart
        }
        
        if let timeEnd = timeEnd {
            param[StexServerConstants.timeEnd] = timeEnd
        }
        
        if let limit = limit {
            param[StexServerConstants.limit] = limit
        }
        
        if let offset = offset {
            param[StexServerConstants.offset] = offset
        }
        
        return param
    }
}
