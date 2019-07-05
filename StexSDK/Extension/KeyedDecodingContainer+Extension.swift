//
//  KeyedDecodingContainer+Extension.swift
//  STEX API
//
//  Created by Alexander Rudyk on 7/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    func decodeStringToDouble(_ key: KeyedDecodingContainer.Key) throws -> Double? {
        guard let doubleString = try? decode(String.self, forKey: key) else { return nil }
        return Double(doubleString)
    }
}
