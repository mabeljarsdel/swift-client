//
//  AccessTokenAdapter.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/12/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class AccessTokenAdapter: RequestAdapter, RequestRetrier {
    
    private var userAgent: String?
    private var apiClient: APIClient?
    
    init(userAgent: String?) {
        self.userAgent = userAgent
    }
    
    func adapt(_ urlRequest: URLRequest, completion: @escaping (Result<URLRequest>) -> Void) {
        var urlRequest = urlRequest
        
        if let accessToken = StexTokensManager.shared.accessToken {
            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        }
        
        if let userAgent = userAgent {
            urlRequest.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        }
        
        completion(.success(urlRequest))
    }
    
    func should(_ manager: Session, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(false, 0.0)
            return
        }
        
        apiClient = APIClient(userAgent: userAgent)
        
        apiClient?.refreshToken { [weak self] result in
            guard let self = self else { return }
            
            self.apiClient = nil
            
            switch result {
            case .success(let tokens):
                StexTokensManager.shared.setTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken)
                completion(true, 0.0)
            case .error(let error):
                print(error.localizedDescription)
                completion(false, 0.0)
            }
        }
    }
}
