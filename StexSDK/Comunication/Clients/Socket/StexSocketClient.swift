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
            guard let self = self,
                let response = StexSocketResponse<StexRate>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveRatesWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.tradeCreated) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexOrderCreated>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveTradesCreatedWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.glassTotalChanget) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexGlassTotalChanged>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveGlassTotalChangedWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.glassRowChanget) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexGlassRowChanged>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveGlassRowChangedWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.bestPriceChanged) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexBestPriceChanged>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveBestPriceChangedWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.candleChanged) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexCandleChanged>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveCandleChangedWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.balanceChanged) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexBalanceChanged>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveBalanceChangedWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.userOrder) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexUserOrder>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveUserOrdersWith: response)
        }
        
        socket?.on(StexSocketConstants.Event.userOrderDeleted) { [weak self] data, ack in
            guard let self = self,
                let response = StexSocketResponse<StexUserOrderDeleted>(with: data) else { return }
            
            self.eventListener?.socket(self, receiveUserOrdersDeletedWith: response)
        }
    }
}
