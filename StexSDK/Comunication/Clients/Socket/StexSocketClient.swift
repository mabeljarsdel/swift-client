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
        manager = SocketManager(socketURL: URL(string: StexSocketConstants.socketURL)!,
                                config: [.log(false)])
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
        send(rout: StexSocketConstants.Event.subscribe, event: event)
    }
    
    //MARK: - Socket unsubscribe with events
    
    public func unsubscribe(withEvents events: [StexSocketEvent]) {
        events.forEach { unsubscribe(withEvent: $0) }
    }
    
    public func unsubscribe(withEvent event: StexSocketEvent) {
        send(rout: StexSocketConstants.Event.unsubscribe, event: event)
    }
    
    //MARK: - Private
    
    private func send(rout: String, event: StexSocketEvent) {
        let token: String? = event.isPrivate ? StexTokensManager.sharded.accessToken : nil
        let params = buildParams(channel: event.channel, token: token)
        
        socket?.emit(rout, params)
    }
    
    private func buildParams(channel: String, token: String? = nil) -> [String: AnyHashable] {
        var param: [String: AnyHashable] = [StexSocketConstants.Param.channel: channel]
        
        if let token = token {
            let headers = [StexSocketConstants.Param.authorization: StexSocketConstants.Param.bearer + " " + token]
            param[StexSocketConstants.Param.auth] = [StexSocketConstants.Param.headers : headers]
        }
        
        return param
    }
    
    private func setupCallbacks() {
        
        socket?.removeAllHandlers()
        
        socket?.on(StexSocketConstants.Event.connect) { [weak self] data, ack in
            guard let self = self else { return }
            self.eventListener?.socket(self, connectWith: data)
        }
        
        socket?.on(StexSocketConstants.Event.disconnect) { [weak self] data, ack in
            guard let self = self else { return }
            self.eventListener?.socket(self, disconnectWith: data)
        }
        
        socket?.on(StexSocketConstants.Event.ticker) { [weak self] data, ack in
            guard let self = self else { return }
            let rates: [StexRate] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveRatesWith: rates)
        }
        
        socket?.on(StexSocketConstants.Event.tradeCreated) { [weak self] data, ack in
            guard let self = self else { return }
            let orders: [StexOrderCreated] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveTradesCreatedWith: orders)
        }
        
        socket?.on(StexSocketConstants.Event.glassTotalChanget) { [weak self] data, ack in
            guard let self = self else { return }
            let totals: [StexGlassTotalChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveGlassTotalChangedWith: totals)
        }
        
        socket?.on(StexSocketConstants.Event.glassRowChanget) { [weak self] data, ack in
            guard let self = self else { return }
            let rows: [StexGlassRowChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveGlassRowChangedWith: rows)
        }
        
        socket?.on(StexSocketConstants.Event.bestPriceChanged) { [weak self] data, ack in
            guard let self = self else { return }
            let prices: [StexBestPriceChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveBestPriceChangedWith: prices)
        }
        
        socket?.on(StexSocketConstants.Event.candleChanged) { [weak self] data, ack in
            guard let self = self else { return }
            let candles: [StexCandleChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveCandleChangedWith: candles)
        }
        
        socket?.on(StexSocketConstants.Event.balanceChanged) { [weak self] data, ack in
            guard let self = self else { return }
            let balances: [StexBalanceChanged] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveBalanceChangedWith: balances)
        }
        
        socket?.on(StexSocketConstants.Event.userOrder) { [weak self] data, ack in
            guard let self = self else { return }
            let orders: [StexUserOrder] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveUserOrdersWith: orders)
        }
        
        socket?.on(StexSocketConstants.Event.userOrderDeleted) { [weak self] data, ack in
            guard let self = self else { return }
            let orders: [StexUserOrderDeleted] = data.compactMap { SocketDataDecoder().decode(withJSONObject: $0) }
            self.eventListener?.socket(self, receiveUserOrdersDeletedWith: orders)
        }
    }
}
