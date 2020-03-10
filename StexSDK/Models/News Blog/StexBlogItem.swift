//
//  StexBlogItem.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 10.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import SWXMLHash

public final class StexBlogItem: XMLIndexerDeserializable {
    
    public var title: String
    public var description: String
    public var link: String
    public var pubDate: String
    public var pubTimestamp: Int?
    public var imageURL: String
    
    enum CodingKeys: String {
        case title
        case description
        case link
        case pubDate
        case imageURL = "url"
        case mediaContent = "media:content"
    }
    
    init(title: String, description: String, link: String, pubDate: String, pubTimestamp: Int?, imageURL: String) {
        self.title = title
        self.description = description
        self.link = link
        self.pubDate = pubDate
        self.pubTimestamp = pubTimestamp
        self.imageURL = imageURL
    }
    
    public static func deserialize(_ element: XMLIndexer) throws -> StexBlogItem {
        let serverTitle = element[CodingKeys.title.rawValue].element?.text ?? ""
        let title = serverTitle.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "  ", with: "")
        let serverDescription = element[CodingKeys.description.rawValue].element?.text ?? ""
        let description = serverDescription.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "  ", with: "")
        let link = element[CodingKeys.link.rawValue].element?.text ?? ""
        let pubDate = element[CodingKeys.pubDate.rawValue].element?.text ?? ""
        let pubTimestamp = pubDate.dateToTimest()
    
        let mediaContent = element[CodingKeys.mediaContent.rawValue].element?.allAttributes
        let imageURL = mediaContent?[CodingKeys.imageURL.rawValue]?.text ?? ""
        
        return StexBlogItem(title: title, description: description, link: link, pubDate: pubDate, pubTimestamp: pubTimestamp, imageURL: imageURL)
    }
}
