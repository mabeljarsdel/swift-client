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
    func socket(_ socketClient: StexSocketClient, receiveGlassTotalChangedWith data: [GlassTotalChanged])
    func socket(_ socketClient: StexSocketClient, receiveGlassRowChangedWith data: [GlassRowChanged])
    func socket(_ socketClient: StexSocketClient, receiveBestPriceChangedWith data: [BestPriceChanged])
    func socket(_ socketClient: StexSocketClient, receiveCandleChangedWith data: [CandleChanged])
    func socket(_ socketClient: StexSocketClient, receiveBalanceChangedWith data: [BalanceChanged])
}

extension ISocketEventListener {
    func socket(_ socketClient: StexSocketClient, connectWith data: [Any]) {}
    func socket(_ socketClient: StexSocketClient, disconnectWith data: [Any]) {}
    
    func socket(_ socketClient: StexSocketClient, receiveTickerWith data: [Rate]) {}
    func socket(_ socketClient: StexSocketClient, receiveTradesCreatedWith data: [OrderCreated]) {}
    func socket(_ socketClient: StexSocketClient, receiveGlassTotalChangedWith data: [GlassTotalChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveGlassRowChangedWith data: [GlassRowChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveBestPriceChangedWith data: [BestPriceChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveCandleChangedWith data: [CandleChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveBalanceChangedWith data: [BalanceChanged]) {}
}
