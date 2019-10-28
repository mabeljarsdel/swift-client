//
//  UpdateNotificationSettingsRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

/// Params for update notification settings
///
/// - Parameters:
///   - event: An event name you want to subscribe.
///   - channel: A channel name you want to receive the notification through.
///   - value: true - to subscribe to the notifications of the given event in the specified channel, false - to remove subscription of the specified event in the specified channel
public typealias NotificationParameters = (event: String, channel: String, value: Bool)

class UpdateNotificationSettingsRequest: IRequest {
    
    private let params: [NotificationParameters]
    
    init(with param: NotificationParameters) {
        params = [param]
    }
    
    init(with params: [NotificationParameters]) {
        self.params = params
    }
    
    var endpoint: String {
        var path = SettingsEndpoints.notifications.path
        
        path += params.count > 1 ? "/set" : ""
        
        return path
    }
    
    var httpMethod: HTTPMethod {
        return .put
    }
    
    private func convert(param: NotificationParameters) -> [String: Any] {
        return [
            StexServerConstants.event: param.event,
            StexServerConstants.channel: param.channel,
            StexServerConstants.value: param.value ? 1 : 0
        ]
    }
    
    func urlRequest() -> URLRequest? {
        guard let url = URL(string: endpoint) else { return nil }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        
        let parameters = params.compactMap { convert(param: $0) }
        
        if parameters.count > 1 {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        } else if let params = parameters.first {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        }
        
        return request
    }
}
