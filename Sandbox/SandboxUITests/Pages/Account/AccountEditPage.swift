//
//  AccountEditPage.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/22/22.
//

import Foundation
import XCTest

class AccountEditPage: BasePage {
    private lazy var txtPageTitle = app.staticTexts["AccountEditPageTitle"].firstMatch
    private lazy var txtEmailHeader = app.staticTexts["AccountEditEmailHeader"].firstMatch
    private lazy var txtPasswordHeader = app.staticTexts["AccountEditPasswordHeader"].firstMatch
    
    @discardableResult
    func verifyIsCurrentPage() -> Self {
        XCTAssert(txtPageTitle.waitForExistence(timeout: 10), "Failed to load account edit page.")
        return self
    }
}
