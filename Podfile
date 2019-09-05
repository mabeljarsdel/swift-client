platform :ios, '11.0'
use_frameworks!

def shared_pods
  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :branch => 'alamofire5'
  pod 'Socket.IO-Client-Swift'
  
  pod 'Locksmith'
  
  pod 'SwiftyJSON'
  
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
end

workspace 'StexSDK'

target 'StexSDK' do
  project 'StexSDK.xcodeproj'
  
  shared_pods
end

target 'StexSDKTests' do
  project 'StexSDK.xcodeproj'
  
  shared_pods
end
