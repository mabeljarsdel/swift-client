//
//  StexSettingsTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexSettingsTest: StexPrivateClientTest {
    
    func testNotificationsList() {
        let expectation = self.expectation(description: "Testing notifications list API")
        
        var notificationsCount = 0
        
        stexClient.fetchNotificationsSettingsList() { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                notificationsCount = data.count
                
                print("Success !!! \nData: ", data.map { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(notificationsCount != 0)
    }
    
    func testNotificatonWithEvent() {
        let expectation = self.expectation(description: "Testing notifications list API")
        
        let expectedNotificationName = "order_created"
        var notificationName = ""
        
        stexClient.fetchNotificationSettings(with: expectedNotificationName) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                notificationName = data.name
                
                print("Success !!! \nData: ", data.name)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(!notificationName.isEmpty)
    }
    
    func testUpdateSingleNotificatonSettings() {
        let expectation = self.expectation(description: "Testing update notification settings API")
        
        let expectedNotificationName = "order_created"
        var notificationName = ""
        
        let param: NotificationParameters = (expectedNotificationName, "site_inbox", false)
        
        stexClient.updateNotificationSettings(with: param) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                notificationName = data.name
                
                print("Success !!! \nData: ", data.name)
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(!notificationName.isEmpty)
    }
    
    func testUpdateNotificatonsSettings() {
        let expectation = self.expectation(description: "Testing update notifications settings API")
        
        var notificationsCount = 0
        
        let params: [NotificationParameters] = [
            ("order_created", "site_inbox", true),
            ("order_canceled", "email", true)
        ]
        
        stexClient.updateNotificationsSettings(with: params) { result in
            switch result {
            case .success(let data):
                expectation.fulfill()
                notificationsCount = data.count
                
                print("Success !!! \nData: ", data.map { $0.name })
            case .error(let error):
                print(error)
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        XCTAssertTrue(notificationsCount != 0)
    }
}
