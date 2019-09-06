//
//  StexSocketClient.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation
import SocketIO

public class StexSocketClient {
    
    var socket: SocketIOClient?
    let manager: SocketManager!
    
    public var eventListener: ISocketEventListener? {
        didSet { setupCallbacks() }
    }
    
    //MARK: - Initialization
    
    public init() {
        manager = SocketManager(socketURL: URL(string: SocketConstants.socketURL)!,
                                config: [.log(true)])
        socket = manager.defaultSocket
    }
    
    //MARK: - Open/Close socket connection
    
    public func establishConnection() {
        if socket?.status == .notConnected || socket?.status == .disconnected {
            socket?.connect()
        }
    }
    
    public func closeConnection() {
        socket?.disconnect()
    }
    
    //MARK: - Socket subscribe to events
    
    public func subscribe(toEvents events: [StexSocketEvent]) {
        events.forEach { subscribe(toEvent: $0) }
    }
    
    public func subscribe(toEvent event: StexSocketEvent) {
        let token: String? = event.isPrivate ? StexTokensManager.sharded.accessToken : nil
        let params = buildParams(channel: event.channel, token: token)
        
        socket?.emit(SocketConstants.Event.subscribe, params)
    }
    
    //MARK: - Private
    
    private func buildParams(channel: String, token: String? = nil) -> [String: AnyHashable] {
        var param: [String: AnyHashable] = [SocketConstants.Param.channel: channel]
        
        if let token = token {
            let headers = [SocketConstants.Param.authorization: SocketConstants.Param.bearer + " " + token]
            param[SocketConstants.Param.auth] = [SocketConstants.Param.headers : headers]
        }
        
        return param
    }
    
    private func setupCallbacks() {
        
        socket?.removeAllHandlers()
        
        socket?.on(SocketConstants.Event.connect) { [weak self] data, ack in
            guard let self = self else { return }
            self.eventListener?.socket(self, connectWith: data)
        }
        
        socket?.on(SocketConstants.Event.disconnect) { [weak self] data, ack in
            guard let self = self else { return }
            self.eventListener?.socket(self, disconnectWith: data)
        }
        
        socket?.on(SocketConstants.Event.ticker) { [weak self] data, ack in
            guard let self = self else { return }
            let rates: [Rate] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveRatesWith: rates)
        }
        
        socket?.on(SocketConstants.Event.tradeCreated) { [weak self] data, ack in
            guard let self = self else { return }
            let orders: [OrderCreated] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveTradesCreatedWith: orders)
        }
        
        socket?.on(SocketConstants.Event.glassTotalChanget) { [weak self] data, ack in
            guard let self = self else { return }
            let totals: [GlassTotalChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveGlassTotalChangedWith: totals)
        }
        
        socket?.on(SocketConstants.Event.glassRowChanget) { [weak self] data, ack in
            guard let self = self else { return }
            let rows: [GlassRowChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveGlassRowChangedWith: rows)
        }
        
        socket?.on(SocketConstants.Event.bestPriceChanged) { [weak self] data, ack in
            guard let self = self else { return }
            let prices: [BestPriceChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveBestPriceChangedWith: prices)
        }
        
        socket?.on(SocketConstants.Event.candleChanged) { [weak self] data, ack in
            guard let self = self else { return }
            let candles: [CandleChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveCandleChangedWith: candles)
        }
        
        socket?.on(SocketConstants.Event.balanceChanged) { [weak self] data, ack in
            guard let self = self else { return }
            let balances: [BalanceChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveBalanceChangedWith: balances)
        }
    }
}
