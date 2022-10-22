//
//  AccountUITests.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/22/22.
//

import Foundation
import XCTest

class AccountUITests: BaseUITest {
    func testOpenAccountPage() {
        DashboardPage()
            .tapAccount()
        AccountPage()
            .verifyIsCurrentPage()
    }
    
    func testEmptyAccountList() {
        DashboardPage()
            .tapAccount()
        AccountPage()
            .verifyEmptyList()
    }
    
    func testAddAccounts() {
        DashboardPage()
            .tapAccount()
        AccountPage()
            .tapCreate()
            .verifyCellCount(is: 1)
            .enterQuantity("5")
            .tapCreate()
            .verifyCellCount(is: 6)
    }
    
    func testClearAccount() {
        DashboardPage()
            .tapAccount()
        AccountPage()
            .tapCreate()
            .verifyCellCount(is: 1)
            .tapClear()
            .verifyCellCount(is: 1)
            .enterQuantity("5")
            .tapCreate()
            .verifyCellCount(is: 5)
            .tapClear()
            .verifyCellCount(is: 1)
    }
    
    func testOpenAccountEditPage() {
        DashboardPage()
            .tapAccount()
        AccountPage()
            .enterQuantity("5")
            .tapCreate()
            .longPressAccount(at: 2)
        AccountEditPage()
            .verifyIsCurrentPage()
    }
}
