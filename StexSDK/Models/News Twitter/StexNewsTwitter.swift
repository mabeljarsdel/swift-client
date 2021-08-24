//
//  StexNewsTwitter.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 26.02.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import Foundation

public class StexNewsTwitter: Codable {
    
    public var name: String
    public var twitterName: String
    public var baseUrl: String
    public var message: String
    public var twitLink: String
    public var urls: [StexNewsTwitterUrls]
    public var twitPublishedTimeAgo: String
    public var twitPublishedTimestamp: Int
    public var imgUrls: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case twitterName = "twitter_name"
        case baseUrl = "base_url"
        case message
        case urls
        case twitPublishedTimeAgo = "twit_published_time_ago"
        case twitPublishedTimestamp = "twit_published_timestamp"
        case imgUrls = "img_urls"
        case twitLink = "twit_link"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        twitterName = try container.decode(String.self, forKey: .twitterName)
        baseUrl = try container.decode(String.self, forKey: .baseUrl)
        message = try container.decode(String.self, forKey: .message)
        urls = try container.decode([StexNewsTwitterUrls].self, forKey: .urls)
        twitPublishedTimeAgo = try container.decode(String.self, forKey: .twitPublishedTimeAgo)
        twitPublishedTimestamp = try container.decode(Int.self, forKey: .twitPublishedTimestamp)
        imgUrls = try? container.decode([String].self, forKey: .imgUrls)
        twitLink = try container.decode(String.self, forKey: .twitLink)
    }
}
