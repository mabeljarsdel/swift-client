# StexSDK (Swift API client)

STEX (former Stocks.Exchange) provides all the core exchange functionality, and additional merchant tools available via the HTTP API where all returned messages are in model class. It's much easier to work with the API by using one of the clients provided by STEX, so while this page describes the API in case you want or need to build your own client, the examples use the Swift client.

![CocoaPods](https://img.shields.io/cocoapods/v/StexSDK.svg)

## Requirements
- iOS 10.0+
- Xcode 10+

## General
The base URL for all the requests other than public methods is 
```
https://api3.stex.com
```

- [Sandbox API V3](https://apidocs.stex.com)

## Integration

#### CocoaPods (iOS 10+)

You can use [CocoaPods](http://cocoapods.org/) to install `StexSDK` by adding it to your `Podfile`:

```ruby
platform :ios, '10.0'
use_frameworks!

target 'MyApp' do
    pod 'StexSDK'
end
```

## Usage

### Initialization

#### StexClient

```swift
import StexSDK

var stexClient = StexClient()

stexClient.fetchAllTicker { result in
    switch result {
    case .success(let data):
        print(data)
    case .error(let error):
        print(error.localizedDescription)
    }
}
```

#### RxStexClient

```swift
import StexSDK

var rxStexClient = RxStexClient()

rxStexClient.fetchAllTicker()
    .subscribe(onNext: { data in
        print(data)
    }, onError: { error in
        print(error.localizedDescription)
    }, onCompleted: nil, onDisposed: nil)
    .dispose()
```

#### Authorized requests

For authorized requests you need set tokens to `StexTokensManager`:

```swift
import StexSDK

var stexClient = StexClient()

StexTokensManager().sharded.setTokens(accessToken: "you_access_token", refreshToken: "yoi_refresh_token")

stexClient.fetchProfileInfo { result in
    switch result {
    case .success(let user):
        print(user.email)
    case .error(let error):
        print(error.localizedDescription)
    }
}
```

#### WebSocket API V3

```swift
import StexSDK

class SocketListener: StexSDK.ISocketEventListener {
    
    var socketClient = StexSocketClient()
    
    init() {
        socketClient.establishConnection()
        socketClient.subscribe(toEvent: .rate)
    }
    
    func socket(_ socketClient: StexSocketClient, receiveRatesWith data: [StexRate]) {
        print(data)
    }
}
```

Or

```swift
import StexSDK

class SocketListener: StexSDK.ISocketEventListener {
    
    var socketClient = StexSocketClient()
    
    init() {
        socketClient.establishConnection()
        socketClient.subscribe(toEvents: [.rate, .buyGlassRowChanget(1), .sellUserOrder(123, 43)])
    }
    
    ...
    
    func socket(_ socketClient: StexSocketClient, receiveRatesWith data: [StexRate]) {
        print(data)
    }
    
    ...
}
```
