//
//  WalletsRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class WalletsRequest: IRequest {
    
    private let id: Int?
    
    private let sortDirection: SortKey?
    private let sortBy: WalletSortKey?
    
    init(with id: Int) {
        self.id = id
        
        sortDirection = nil
        sortBy = nil
    }
    
    init(with sortDirection: SortKey? = .desc, sortBy: WalletSortKey? = .balance) {
        self.sortDirection = sortDirection
        self.sortBy = sortBy
        
        id = nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        var path = ProfileEndpoints.wallets.path
        
        path += id == nil ? "" : "/\(id!)"
        
        return path
    }
    
    func parameters() -> Parameters? {
        guard id == nil else { return nil }
        
        var params: Parameters = [:]
        
        if let sortDirection = sortDirection {
            params[StexServerConstants.sort] = sortDirection.rawValue.uppercased()
        }
        
        if let sortBy = sortBy {
            params[StexServerConstants.sortBy] = sortBy.rawValue.uppercased()
        }
        
        return params
    }
}
