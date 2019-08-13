//
//  APIClient.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

public class APIClient {
    
    private var session: Session
    
    public init() {
        let adapter = AccessTokenAdapter()
        
        session = Session(adapter: adapter, retrier: adapter)
    }
    
    @discardableResult
    func request<T: Codable> (_ req: IRequest, completion: @escaping (StexResult<T>) -> ()) -> DataRequest {
        
        let request = session.request(req.endpoint,
                                      method: req.httpMethod,
                                      parameters: req.parameters(),
                                      encoding: req.encoding,
                                      headers: req.httpHeaders())
        
        request.validate().responseDecodable { (response: DataResponse<StexResponse<T>>) in
            switch response.result {
            case .success(let data):
                let result = StexResult(response: data)
                completion(result)
            case .failure(let error):
                completion(.error(error))
            }
        }
        
        return request
    }
}

extension APIClient {
    func refreshToken(completion: @escaping (StexResult<Tokens>) -> ()) {
        request(RefreshTokensRequest(), completion: completion)
    }
}
