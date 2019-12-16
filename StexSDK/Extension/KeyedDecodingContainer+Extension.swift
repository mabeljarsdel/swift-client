//
//  KeyedDecodingContainer+Extension.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public enum StexDecodingError: Error {
    case anUnexpectedResult
}

extension KeyedDecodingContainer {
    func decodeStringToDouble(_ key: KeyedDecodingContainer.Key) throws -> Double? {
        guard let doubleString = try? decode(String.self, forKey: key) else { return nil }
        return Double(doubleString)
    }
    
    func decodeStringToDouble(_ key: KeyedDecodingContainer.Key) throws -> Double {
        guard let double = try? decodeStringToDouble(key) else {
            throw StexDecodingError.anUnexpectedResult }
        
        return double
    }
    
    func decodeStringToInt32(_ key: KeyedDecodingContainer.Key) throws -> Int32? {
        guard let int32String = try? decode(String.self, forKey: key) else { return nil }
        return Int32(int32String)
    }
}
