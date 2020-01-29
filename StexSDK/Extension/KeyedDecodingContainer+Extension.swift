//
//  KeyedDecodingContainer+Extension.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    
    func decodeDouble(_ key: KeyedDecodingContainer.Key) throws -> Double? {
        if let double = try? decode(Double.self, forKey: key) {
            return double
        } else if let doubleString = try? decode(String.self, forKey: key) {
            return Double(doubleString)
        }
        
        return nil
    }
    
    func decodeStringToDouble(_ key: KeyedDecodingContainer.Key) throws -> Double? {
        guard let doubleString = try? decode(String.self, forKey: key) else { return nil }
        return Double(doubleString)
    }
    
    func decodeStringToInt32(_ key: KeyedDecodingContainer.Key) throws -> Int32? {
        guard let int32String = try? decode(String.self, forKey: key) else { return nil }
        return Int32(int32String)
    }
}
