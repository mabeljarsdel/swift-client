//
//  PairGroup.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class PairGroup: Codable {
    
    /// CurrencyPairGroup ID.
    ///
    /// Example: `1`
    public var id: Int
    
    /// CurrencyPairGroup name.
    ///
    /// Example: `FIAT markets`
    public var name: String
    
    /// Postion of the group for sorting.
    ///
    /// Example: `5`
    public var position: Int
}
