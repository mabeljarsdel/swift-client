//
//  APIClient.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire
import SWXMLHash

public class APIClient {
    
    private var session: Session
    
    public init(userAgent: String? = nil) {
        let adapter = AccessTokenAdapter(userAgent: userAgent)
        
        session = Session(adapter: adapter, retrier: adapter)
    }
    
    @discardableResult
    func request<T: Codable> (_ req: IRequest, completion: @escaping (StexResult<T>) -> ()) -> DataRequest {
        
        let request: DataRequest = buildRequest(from: req)
        
        request.validate().responseDecodable { [weak self] (response: DataResponse<StexResponse<T>>) in
            guard let self = self else { return }
            
            #if DEBUG
            print("[\(req.httpMethod.rawValue.uppercased())] Responce from: \(req.endpoint), statusCode: \(response.response?.statusCode ?? 0)")
            #endif
            
            switch response.result {
            case .success(let data):
                let result = StexResult(response: data)
                completion(result)
            case .failure(let error):
                self.handleErrorResponce(response: response, error: error, completion: completion)
            }
        }
        
        return request
    }
    
    @discardableResult
    func request<T: XMLIndexerDeserializable> (_ req: IRequest, completion: @escaping (StexXMLResult<T>) -> ()) -> DataRequest {
        
        let request: DataRequest = buildRequest(from: req)
        
        request.validate().responseData { response in
            
            #if DEBUG
            print("[\(req.httpMethod.rawValue.uppercased())] Responce from: \(req.endpoint), statusCode: \(response.response?.statusCode ?? 0)")
            #endif
            
            switch response.result {
            case .success(let data):
                let indexer = SWXMLHash.parse(data)
                let result = StexXMLResult<T>(indexer)
                completion(result)
            
            case .failure(let error):
                let stexError = StexResultError.undefinedError(statusCode: response.response?.statusCode, error: error)
                completion(.error(stexError))
            }
        }
        
        return request
    }
    
    //MARK: - Private
    
    private func buildRequest(from req: IRequest) -> DataRequest {
        if let urlRequest = req.urlRequest() {
            return session.request(urlRequest)
        } else {
            return session.request(req.endpoint,
                                      method: req.httpMethod,
                                      parameters: req.parameters(),
                                      encoding: req.encoding,
                                      headers: req.httpHeaders())
        }
    }
    
    private func handleErrorResponce<T: Codable>(response: DataResponse<StexResponse<T>>, error: Error, completion: @escaping (StexResult<T>) -> ()) {
        guard let statusCode = response.response?.statusCode else {
            let stexError = StexResultError.undefinedError(statusCode: 400, error: error)
            completion(.error(stexError))
            return
        }
        
        if let data = response.data,
            let errorResponse = try? JSONDecoder().decode(StexResponse<T>.self, from: data) {
            
            let result = StexResult(response: errorResponse, statusCode: statusCode)
            completion(result)
        } else {
            switch statusCode {
            case 401:
                completion(.error(StexResultError.unauthorized))
            default:
                let stexError = StexResultError.undefinedError(statusCode: statusCode, error: error)
                completion(.error(stexError))
            }
        }
    }
}

extension APIClient {
    func refreshToken(completion: @escaping (StexResult<Tokens>) -> ()) {
        request(RefreshTokensRequest(), completion: completion)
    }
}
