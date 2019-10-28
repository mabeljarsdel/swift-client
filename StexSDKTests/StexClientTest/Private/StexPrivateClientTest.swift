//
//  StexPrivateClientTest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import XCTest

class StexPrivateClientTest: StexClientTest {
    
    override func setUp() {
        StexTokensManager.sharded.setTokens(accessToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRkZjk3NjA3YjFmMDUxNGVhM2Q3NDgzNjllNWZmOTkzZDUyY2ViZWRmNjc3YzcyNGNmYmFiNjQ0OGNlMjgxMzZiZDcwNmVlMDY3YTliN2MwIn0.eyJhdWQiOiIyIiwianRpIjoiZGRmOTc2MDdiMWYwNTE0ZWEzZDc0ODM2OWU1ZmY5OTNkNTJjZWJlZGY2NzdjNzI0Y2ZiYWI2NDQ4Y2UyODEzNmJkNzA2ZWUwNjdhOWI3YzAiLCJpYXQiOjE1NzIyNTg1MTEsIm5iZiI6MTU3MjI1ODUxMSwiZXhwIjoxNTcyMzAxNzExLCJzdWIiOiI5MTE0MyIsInNjb3BlcyI6WyJtb2JpbGUiXX0.BVuPzJi_xJeb7LI0fmJYLVQPP29C5fPGQJ69pqJR0kWTUe0zl4Gru56NxD9Ji9O09t5VZqhqFPAaukwdOEzJIx3JnVUaLwrpp-BWi9Na5OpZ2_bBxarNByko7_TvBbWSdo_XrZzQ4Kz7_AIJSAz3W0nTJpY4mBDVIYfvpwMVfsYaj5qbmwbIADyVKF_u1Fzl7ym9DtTBqxpX2ytsAjugeoJQHUFvB6b7t9wVNrIYx0v6ni7gyrSDQLhTI6uBB3SRXKnrIyYGEihFySSC3ipaeCIA14K5vPa4LY3QMvNrKoArYTkSLaSI5TYhc8GoQDouVbesSde59i_PehmGgQosVUTMGuuJfw7BK3wnxFnTCgTeeUqsk6rqObY2tq56CQfd7ClJGYDG5jfPNvfjDtxqb0UM5IghkAt9zU0sbv-uLkqigeEU25fdOkFtnOhcu6Ah5pxTvpBnzlKRqU2JKrMKhzPzfqHLaxP4r0bsasDwoF7qajNI144KCoyl1F3op494tIJJZ34lDX6jt9tRerDzdOXe7GuX-O33hqVDURAqQcTIgC49cvW72VmV7io89xt6vQC8zgGnWP_qOgSIB4zGI65F2tB3tZxv4-tq4YQw2T-vYgryukz_Uc4U8yWaayzE6t48zXrAxbVqjRyQ4BiSpQAqEic6h7kgljA12U2kB4M", refreshToken: "your_refresh_token")
        
        super.setUp()
        
        timeout = 5
    }
}
