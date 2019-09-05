//
//  StexSocketClient.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation
import SocketIO

public enum StexSocketEvent {
    /// Ticker changes
    case rate
    
    /// New trades for the given currency pair
    case tradeCreated(Int)
    
    var channel: String {
        switch self {
        case .rate:
            return SocketConstants.Channels.rate
        case .tradeCreated(let pairId):
            return SocketConstants.Channels.tradeCreated + "\(pairId)"
        }
    }
    
    var isPrivate: Bool {
        switch self {
        case .rate, .tradeCreated(_):
            return false
        }
    }
}

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
            let headers = [SocketConstants.Param.authorization: SocketConstants.Param.bearer + token]
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
    }
}
