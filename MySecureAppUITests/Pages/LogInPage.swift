//
//  LogInPage.swift
//  MySecureAppUITests
//
//  Created by Zhaneordo on 1/29/22.
//

import XCTest

struct LogInPage: Page {
    var app: XCUIApplication
    
    enum Identifier: String {
        case email = "LogInPage.emailAddress"
        case password = "LogInPage.password"
        case logIn = "LogInPage.logIn"
    }
    
    func verify() -> Self {
        var isVisible = false
        
        let loginPage = app.staticTexts.matching(identifier: "LogInPage").element
        
        isVisible = loginPage.waitForExistence(timeout: 3)
        XCTAssertTrue(isVisible)
        return self
    }
    
    func type(email: String, password: String) -> Self {
        let emailField = app.textFields[Identifier.email.rawValue]
        let passwordField = app.secureTextFields[Identifier.password.rawValue]
        
        if emailField.waitForExistence(timeout: 1) {
            emailField.tap()
            emailField.typeText(email)
        } else {
            XCTFail("Error => Missing email field")
        }
        
        if passwordField.waitForExistence(timeout: 1) {
            passwordField.tap()
            passwordField.typeText(password)
        } else {
            XCTFail("Error => Missing password field")
        }
        
        return self
    }
    
    func tapLogInButton() -> Self {
        let logInButton = app.buttons[Identifier.logIn.rawValue]
        
        if logInButton.waitForExistence(timeout: 1) {
            logInButton.tap()
        } else {
            XCTFail("Error => Missing log in button")
        }
        
        return self
    }
}
