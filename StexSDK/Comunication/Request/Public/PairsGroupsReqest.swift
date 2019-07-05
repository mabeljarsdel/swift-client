//
//  PairsGroupsReqest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

/**
 Available currency pairs groups (as displayed at stex trading page).
 Get list of all avialable currency pairs groups.
 */

class PairsGroupsReqest: IRequest {
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.pairsGroups.path
    }
}
