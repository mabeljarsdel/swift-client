#
#  Be sure to run `pod spec lint StexSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "StexSDK"
  spec.version      = "0.0.28"
  spec.summary      = "A short description of StexSDK."
  spec.homepage     = "http://stex.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Alexander Rudyk" => "alakai.1998.28@gmail.com" }
  spec.source       = { :git => "https://github.com/StocksExchange/swift-client.git", :tag => "#{spec.version}" }
  
  spec.ios.deployment_target = "10.0"
  
  spec.swift_version = '5.0'
  
  spec.source_files  = "StexSDK/**/*.swift"

  spec.dependency 'Alamofire', '5.0.0.beta.1'
  spec.dependency 'Socket.IO-Client-Swift'
  spec.dependency 'Locksmith'
  spec.dependency 'RxSwift', '~> 4.0'
  spec.dependency 'SWXMLHash', '~> 5.0.0'

end
