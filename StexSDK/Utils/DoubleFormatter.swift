//
//  DoubleFormatter.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

class DoubleFormatter {
    class func formatServer(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.positiveFormat = "0.00000000"
        formatter.decimalSeparator = "."
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
}
