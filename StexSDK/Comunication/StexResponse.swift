//
//  StexResponse.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public enum StexResultError: Error {
    case serverError(String)
    
    var localizedDescription: String {
        switch self {
        case .serverError(let message):
            return message
        }
    }
}

public struct StexResponse<T: Codable>: Codable {
    var isSuccess: Bool
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case message
        case data
    }
}

public enum StexResult<Value: Codable> {
    
    case success(Value)
    case error(Error)
    
    init(response: StexResponse<Value>) {
        if response.isSuccess, let data = response.data {
            self = .success(data)
        } else {
            let message = response.message ?? "Server error"
            self = .error(StexResultError.serverError(message))
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
    public var error: Error? {
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
