//
//  LogInTestCases.swift
//  MySecureAppUITests
//
//  Created by Zhaneordo on 1/29/22.
//

import XCTest

class LogInTestCases: UITests {
    var loginPage: LogInPage { return LogInPage(app: app) }
    var contentPage: ContentPage { return ContentPage(app: app) }
    
    func test_validLogIn() {
        _ = loginPage
                .verify()
                .type(email: "some@email.com", password: "password")
                .tapLogInButton()
        
        _ = contentPage
                .verify()
    }
}
