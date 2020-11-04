//
//  StexBlogItems.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 10.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import SWXMLHash

public final class StexBlogItems: XMLIndexerDeserializable {
    
    public let items: [StexBlogItem]
    
    init(items: [StexBlogItem]) {
        self.items = items
    }
    
    public static func deserialize(_ element: XMLIndexer) throws -> StexBlogItems {
        let xmlItems = element["rss"]["channel"]["item"].all
        let items = xmlItems.compactMap { try? StexBlogItem.deserialize($0) }
        return StexBlogItems(items: items)
    }
}
