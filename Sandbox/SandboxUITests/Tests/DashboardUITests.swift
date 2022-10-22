//
//  DashboardUITests.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation
import XCTest

class DashboardUITests: BaseUITest {
    
    func testDashboardUIElements() throws {
        DashboardPage()
            .verifyIsCurrentPage()
            .verifyPageTitle()
            .tapCounter()
    }
}
