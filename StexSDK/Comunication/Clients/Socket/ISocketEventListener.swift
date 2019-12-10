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
    
    func socket(_ socketClient: StexSocketClient, receiveRatesWith response: StexSocketResponse<StexRate>)
    func socket(_ socketClient: StexSocketClient, receiveTradesCreatedWith response: StexSocketResponse<StexOrderCreated>)
    func socket(_ socketClient: StexSocketClient, receiveGlassTotalChangedWith response: StexSocketResponse<StexGlassTotalChanged>)
    func socket(_ socketClient: StexSocketClient, receiveGlassRowChangedWith response: StexSocketResponse<StexGlassRowChanged>)
    func socket(_ socketClient: StexSocketClient, receiveBestPriceChangedWith response: StexSocketResponse<StexBestPriceChanged>)
    func socket(_ socketClient: StexSocketClient, receiveCandleChangedWith response: StexSocketResponse<StexCandleChanged>)
    func socket(_ socketClient: StexSocketClient, receiveBalanceChangedWith response: StexSocketResponse<StexBalanceChanged>)
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersWith response: StexSocketResponse<StexUserOrder>)
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersDeletedWith response: StexSocketResponse<StexUserOrderDeleted>)
}

extension ISocketEventListener {
    func socket(_ socketClient: StexSocketClient, connectWith data: [Any]) {}
    func socket(_ socketClient: StexSocketClient, disconnectWith data: [Any]) {}
    
    func socket(_ socketClient: StexSocketClient, receiveRatesWith response: StexSocketResponse<StexRate>) {}
    func socket(_ socketClient: StexSocketClient, receiveTradesCreatedWith response: StexSocketResponse<StexOrderCreated>) {}
    func socket(_ socketClient: StexSocketClient, receiveGlassTotalChangedWith response: StexSocketResponse<StexGlassTotalChanged>) {}
    func socket(_ socketClient: StexSocketClient, receiveGlassRowChangedWith response: StexSocketResponse<StexGlassRowChanged>) {}
    func socket(_ socketClient: StexSocketClient, receiveBestPriceChangedWith response: StexSocketResponse<StexBestPriceChanged>) {}
    func socket(_ socketClient: StexSocketClient, receiveCandleChangedWith response: StexSocketResponse<StexCandleChanged>) {}
    func socket(_ socketClient: StexSocketClient, receiveBalanceChangedWith response: StexSocketResponse<StexBalanceChanged>) {}
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersWith response: StexSocketResponse<StexUserOrder>) {}
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersDeletedWith response: StexSocketResponse<StexUserOrderDeleted>) {}
}
