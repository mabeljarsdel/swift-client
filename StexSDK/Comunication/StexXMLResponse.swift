//
//  StexXMLResponse.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 09.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import SWXMLHash

public enum StexXMLResult<Value: XMLIndexerDeserializable> {
    
    case success(Value)
    case error(StexResultError)
    
    init(_ indexer: XMLIndexer, statusCode: Int = 400) {
        
        switch indexer {
        case .xmlError(let error):
             self = .error(StexResultError.undefinedError(statusCode: statusCode, error: error))
        case .parsingError(let error):
            self = .error(StexResultError.undefinedError(statusCode: statusCode, error: error))
        default:
            guard let data = try? Value.deserialize(indexer) else {
                self = .error(StexResultError.undefinedError(statusCode: statusCode, error: nil))
                return
            }
            
            self = .success(data)
        }
    }
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var data: Value? {
        switch self {
        case .success(let value):
            return value
        case .error:
            return nil
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: StexResultError? {
        switch self {
        case .success:
            return nil
        case .error(let error):
            return error
        }
    }
    
    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .error:
            return false
        }
    }
}
