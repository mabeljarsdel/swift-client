//
//  StexUserSettings.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 22.11.2019.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexUserSettings: Codable {
    
    public var isGoogleAuthEnabled: Bool
    public var isSmsOtpEnabled: Bool
    public var isSecurityKeyEnabled: Bool
    public var isEmailEncryptionEnabled: Bool
    public var isConfirmWithdrawalsWith2fa: Bool
    public var isConfirmWithdrawalsWithEmail: Bool
    
    enum CodingKeys: String, CodingKey {
        case isGoogleAuthEnabled = "google_auth_enabled"
        case isSmsOtpEnabled = "sms_otp_enabled"
        case isSecurityKeyEnabled = "security_key_enabled"
        case isEmailEncryptionEnabled = "email_encryption_enabled"
        case isConfirmWithdrawalsWith2fa = "confirm_withdrawals_with_2fa"
        case isConfirmWithdrawalsWithEmail = "confirm_withdrawals_with_email"
    }
}
