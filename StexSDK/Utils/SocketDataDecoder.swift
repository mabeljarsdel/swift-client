//
//  SocketDataDecoder.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/4/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

class SocketDataDecoder {
    func decode<Model: Codable>(withJSONObject object: Any) -> Model? {
        guard object is NSDictionary else { return nil }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: object)
            let model = try JSONDecoder().decode(Model.self, from: data)
            
            return model
        } catch(let error) {
            print("<SocketDataDecoder> decoding error: - \(error.localizedDescription)")
            
            return nil
        }
    }
}
