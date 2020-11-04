//
//  StexResultError.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 09.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import Foundation

public struct StexResultError: Error {
    
    public private(set) var statusCode: Int?
    public private(set) var message: String
    public private(set) var error: Error?
    
    public var localizedDescription: String {
        return error?.localizedDescription ?? message
    }
    
    static var unauthorized: StexResultError {
        return StexResultError(statusCode: 401, message: "401 Unauthorized", error: nil)
    }
    
    static func undefinedError(statusCode: Int?, error: Error? = nil) -> StexResultError {
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
