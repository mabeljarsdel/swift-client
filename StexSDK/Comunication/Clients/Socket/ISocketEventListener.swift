//
//  ISocketEventListener.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public protocol ISocketEventListener {
    func socket(_ socketClient: StexSocketClient, connectWith data: [Any])
    func socket(_ socketClient: StexSocketClient, disconnectWith data: [Any])
    
    func socket(_ socketClient: StexSocketClient, receiveRatesWith data: [Rate])
    func socket(_ socketClient: StexSocketClient, receiveTradesCreatedWith data: [OrderCreated])
}

extension ISocketEventListener {
    func socket(_ socketClient: StexSocketClient, connectWith data: [Any]) {}
    func socket(_ socketClient: StexSocketClient, disconnectWith data: [Any]) {}
    
    func socket(_ socketClient: StexSocketClient, receiveTickerWith data: [Rate]) {}
    func socket(_ socketClient: StexSocketClient, receiveTradesCreatedWith data: [OrderCreated]) {}
}
