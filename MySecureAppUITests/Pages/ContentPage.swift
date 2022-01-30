//
//  ContentPage.swift
//  MySecureAppUITests
//
//  Created by Zhaneordo on 1/29/22.
//

import XCTest

struct ContentPage: Page {
    var app: XCUIApplication
    
    enum Identifier: String {
        case contentPage = "ContentPage"
    }
    
    func verify() -> Self {
        var isVisible = false
        
        let contentPage = app.otherElements[Identifier.contentPage.rawValue]
        
        isVisible = contentPage.waitForExistence(timeout: 3)
        XCTAssertTrue(isVisible)
        return self
    }
}
