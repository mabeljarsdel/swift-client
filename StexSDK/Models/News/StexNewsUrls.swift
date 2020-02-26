//
//  StexNewsUrls.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 26.02.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import Foundation

public class StexNewsUrls: Codable {
    public var url: String
    public var expandedUrl: String
    public var displayUrl: String
    public var indices: [Int]
    
    enum CodingKeys: String, CodingKey {
        case url
        case expandedUrl = "expanded_url"
        case displayUrl = "display_url"
        case indices
    }
}
