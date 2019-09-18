//
//  ChartRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/7/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class ChartRequest: IRequest {
    
    private var id: Int
    private var candlesType: CandlesType
    private var timeStart: Double
    private var timeEnd: Double
    private var limit: Int
    private var offset: Int?
    
    init(with id: Int, candlesType: CandlesType = .oneDay, timeStart: Double, timeEnd: Double, limit: Int = 100, offset: Int? = nil) {
        self.id = id
        self.candlesType = candlesType
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.limit = limit
        self.offset = offset
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.chart.path + "/\(id)/\(candlesType.rawValue)"
    }
    
    func parameters() -> Parameters? {
        var param: Parameters = [
            StexServerConstants.timeStart: timeStart,
            StexServerConstants.timeEnd: timeEnd,
            StexServerConstants.limit: limit
        ]
        
        if let offset = offset {
            param[StexServerConstants.offset] = offset
        }
        
        return param
    }
}
