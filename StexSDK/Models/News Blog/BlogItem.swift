//
//  BlogItem.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 10.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import SWXMLHash

public final class BlogItem: XMLIndexerDeserializable {
    
    var title: String
    var description: String
    var link: String
    var pubDate: String
    var pubTimestamp: Int?
    var imageURL: String
    
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
    
    public static func deserialize(_ element: XMLIndexer) throws -> BlogItem {
        let serverTitle = element[CodingKeys.title.rawValue].element?.text ?? ""
        let title = serverTitle.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "  ", with: "")
        let serverDescription = element[CodingKeys.description.rawValue].element?.text ?? ""
        let description = serverDescription.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "  ", with: "")
        let link = element[CodingKeys.link.rawValue].element?.text ?? ""
        let pubDate = element[CodingKeys.pubDate.rawValue].element?.text ?? ""
        let pubTimestamp = pubDate.dateToTimest()
    
        let mediaContent = element[CodingKeys.mediaContent.rawValue].element?.allAttributes
        let imageURL = mediaContent?[CodingKeys.imageURL.rawValue]?.text ?? ""
        
        return BlogItem(title: title, description: description, link: link, pubDate: pubDate, pubTimestamp: pubTimestamp, imageURL: imageURL)
    }
}
