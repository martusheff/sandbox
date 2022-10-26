//
//  AccountPage.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/22/22.
//

import Foundation
import XCTest

class AccountPage: BasePage {
    
    private lazy var lstAccount = app.collectionViews["AccountList"].firstMatch
    private lazy var txtFldPrefix = app.textFields["AccountPrefixTextField"].firstMatch
    private lazy var txtFldDomain = app.textFields["AccountDomainTextField"].firstMatch
    private lazy var txtFldQuantity = app.textFields["AccountQuantityTextField"].firstMatch
    private lazy var txtCount = app.staticTexts["AccountCountLabel"].firstMatch
    private lazy var txtCreateAccount = app.staticTexts["AccountCreateButtonLabel"].firstMatch
    private lazy var btnCreateAccount = app.buttons["AccountCreateButton"].firstMatch
    private lazy var btnClear = app.buttons["AccountClearButton"].firstMatch
    
    private var accountCount: Int {
        return lstAccount.cells.count
    }
    
    @discardableResult
    func verifyIsCurrentPage() -> Self {
        XCTAssert(lstAccount.exists, "Failed to load Account page.")
        return self
    }
    
    @discardableResult
    func verifyCount(is expectedCount: Int) -> Self {
        guard let actualCount = Int(txtCount.label) else {
            XCTFail("Unable to parse Int from text count label '\(txtCount.label)'.")
            return self
        }
        XCTAssertEqual(expectedCount, actualCount, "Nav bar count is inccorect.")
        return self
    }
    
    @discardableResult
    func verifyUIElementsExistence() -> Self {
        XCTAssert(btnCreateAccount.exists, "Failed to locate create account button.")
        XCTAssert(btnClear.exists, "Failed to locate clear button.")
        XCTAssert(txtFldPrefix.exists, "Failed to locate prefix text field.")
        XCTAssert(txtFldDomain.exists, "Failed to locate domain text field.")
        XCTAssert(txtFldQuantity.exists, "Failed to locate quantity text field.")
        return self
    }
    
    @discardableResult
    func verifyCellCount(is expectedCount: Int) -> Self {
        XCTAssertEqual(expectedCount, lstAccount.cells.count, "Accounts cell count in list not as expected.")
        return self
    }
    
    @discardableResult
    func verifyEmptyList() -> Self {
        XCTAssertEqual(lstAccount.cells.firstMatch.staticTexts.firstMatch.label, "Create an account to continue...",
            "Expected empty list with call to action, empty list cell label is incorrect.")
        return self
    }
    
    func longPressAccount(at index: Int) {
        guard index - 1 <= accountCount else {
            XCTFail("Failed to tap account at index '\(index)', total count is '\(accountCount)'.")
            return
        }
        lstAccount.cells.allElementsBoundByIndex[index].press(forDuration: 3.0)
    }
    
    @discardableResult
    func tapCreate() -> Self {
        btnCreateAccount.tap()
        return self
    }
    
    @discardableResult
    func tapClear() -> Self {
        btnClear.tap()
        return self
    }
    
    @discardableResult
    func enterDomain(_ domain: String) -> Self {
        txtFldDomain.typeText(domain)
        return self
    }
    
    func enterPrefix(_ emailPrefix: String) -> Self {
        txtFldPrefix.typeText(emailPrefix)
        return self
    }
    
    func enterQuantity(_ quantity: String) -> Self {
        txtFldQuantity.tap()
        txtFldQuantity.typeText(quantity)
        return self
    }
    
}
