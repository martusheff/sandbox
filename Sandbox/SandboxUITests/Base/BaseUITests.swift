//
//  BaseUITests.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation
import XCTest

class BaseUITest: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
}
