//
//  StexDepositAddress.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexDepositAddress: Codable {
    
    /// The main address, may be additionally required more data (see below)
    public var address: String?
    
    /// A label that usualy is shown to identify the address field
    public var addressName: String?
    
    /// If the address consists of two parts this parameter contains the second part (i.e. payment ID, destination tag, etc)
    public var additionalAddressParameter: String?
    
    /// A name of the second part of the deposit address (if required).
    public var additionalAddressParameterName: String?
    
    /// An optional notification for this currency's depositing rules or limitations, etc
    public var notification: String?
    
    /// Used only for wallets accepting different protocols (e.g. Omni and ERC20)
    public var protocolId: Int?
    
    /// Used only for wallets accepting different protocols (e.g. Omni and ERC20)
    public var protocolName: String?
    
    public var isSupportsNewAddressCreation: Bool?
    
    enum CodingKeys: String, CodingKey {
        case address
        case addressName = "address_name"
        case additionalAddressParameter = "additional_address_parameter"
        case additionalAddressParameterName = "additional_address_parameter_name"
        case notification
        case protocolId = "protocol_id"
        case protocolName = "protocol_name"
        case isSupportsNewAddressCreation = "supports_new_address_creation"
    }
}
