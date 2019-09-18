platform :ios, '11.0'
use_frameworks!

def shared_pods
  pod 'Alamofire', '5.0.0.beta.1'
  pod 'Socket.IO-Client-Swift'
  
  pod 'Locksmith'
  
  pod 'RxSwift', '~> 4.0'
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
