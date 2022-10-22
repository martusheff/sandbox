//
//  CounterPage.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation
import XCTest

class CounterPage: BasePage {
    private lazy var txtCount = app.staticTexts["CountText"].firstMatch
    private lazy var btnIncrement = app.buttons["CountIncrementButton"].firstMatch
    private lazy var btnDecrement = app.buttons["CountDecrementButton"].firstMatch
    private lazy var btnReset = app.buttons["CountResetButton"].firstMatch
    
    @discardableResult
    func verifyIsCurrentPage() -> Self {
        XCTAssert(txtCount.exists, "Failed to load count page.")
        return self
    }
    
    @discardableResult
    func verifyCount(matches expectedCount: Int) -> Self {
        guard let actualCount = Int(txtCount.label.filter("0123456789".contains)) else {
            XCTFail("Unable to get count # from count label.")
            return self
        }
        XCTAssertEqual(actualCount, expectedCount)
        return self
    }
    
    func tapIncrement(_ times: Int = 1) -> Self {
        for _ in 1...times {
            btnIncrement.tap()
        }
        return self
    }
    
    func tapDecrement(_ times: Int = 1) -> Self {
        for _ in 1...times {
            btnDecrement.tap()
        }
        return self
    }
    
    func tapReset() -> Self {
        btnReset.tap()
        return self
    }
}
