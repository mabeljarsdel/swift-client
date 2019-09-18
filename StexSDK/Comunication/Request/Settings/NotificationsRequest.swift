//
//  NotificationsRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class NotificationsRequest: IRequest {
    
    private let event: String?
    
    init(with event: String? = nil) {
        self.event = event
    }
    
    var endpoint: String {
        var path = SettingsEndpoints.notifications.path
        
        path += event == nil ? "" : "/\(event!)"
        
        return path
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
