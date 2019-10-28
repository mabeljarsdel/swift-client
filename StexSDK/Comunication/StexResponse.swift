//
//  StexResponse.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public struct StexResultError: Error {
    
    public private(set) var statusCode: Int
    public private(set) var message: String
    public private(set) var error: Error?
    
    public var localizedDescription: String {
        return error?.localizedDescription ?? message
    }
    
    static var unauthorized: StexResultError {
        return StexResultError(statusCode: 401, message: "401 Unauthorized", error: nil)
    }
    
    static func undefinedError(statusCode: Int, error: Error? = nil) -> StexResultError {
        return StexResultError(statusCode: statusCode, message: "Oops! Something went wrong.", error: error)
    }
    
    static func serverMessage(statusCode: Int, message: String?) -> StexResultError {
        if let message = message {
            return StexResultError(statusCode: statusCode, message: message, error: nil)
        } else {
            return undefinedError(statusCode: statusCode)
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
    case error(StexResultError)
    
    init(response: StexResponse<Value>, statusCode: Int = 400) {
        if response.isSuccess, let data = response.data {
            self = .success(data)
        } else {
            self = .error(StexResultError.serverMessage(statusCode: statusCode, message: response.message))
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
