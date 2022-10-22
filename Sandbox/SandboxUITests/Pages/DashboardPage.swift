//
//  DashboardPage.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation
import XCTest

class DashboardPage: BasePage {
    private lazy var btnCounter = app.buttons["DashboardCounterLink"].firstMatch
    private lazy var txtPageTitle = app.staticTexts["Sandbox"].firstMatch
    
    
    func tapCounter() {
        btnCounter.tap()
    }
    
    @discardableResult
    func verifyIsCurrentPage() -> Self {
        XCTAssert(txtPageTitle.exists, "Failed to load dashboard page.")
        return self
    }
    
    @discardableResult
    func verifyPageTitle() -> Self {
        let expectedPageTitle = "Sandbox"
        let actualPageTitle = txtPageTitle.label
        XCTAssertEqual(actualPageTitle, expectedPageTitle, "Unexpected page title '\(actualPageTitle)', expected page title to be '\(expectedPageTitle)'.")
        return self
    }
    
    @discardableResult
    func verifyCounter() -> Self {
        XCTAssert(btnCounter.exists, "Failed to locate counter button.")
        return self
    }
}
