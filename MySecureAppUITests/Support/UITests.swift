//
//  UITests.swift
//  MySecureAppUITests
//
//  Created by Zhaneordo on 1/29/22.
//

import XCTest

class UITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
}
