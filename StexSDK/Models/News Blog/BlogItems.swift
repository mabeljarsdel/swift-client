//
//  BlogItems.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 10.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import SWXMLHash

public final class BlogItems: XMLIndexerDeserializable {
    
    let items: [BlogItem]
    
    init(items: [BlogItem]) {
        self.items = items
    }
    
    public static func deserialize(_ element: XMLIndexer) throws -> BlogItems {
        let xmlItems = element["rss"]["channel"]["item"].all
        let items = xmlItems.compactMap { try? BlogItem.deserialize($0) }
        return BlogItems(items: items)
    }
}
