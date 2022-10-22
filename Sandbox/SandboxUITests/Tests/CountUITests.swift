//
//  CountUITests.swift
//  SandboxUITests
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation
import XCTest

class CountUITests: BaseUITest {
    func testOpenCounterPage() {
        DashboardPage()
            .tapCounter()
        CounterPage()
            .verifyIsCurrentPage()
    }
    
    func testCounterStartingState() {
        DashboardPage()
            .tapCounter()
        CounterPage()
            .verifyCount(matches: 0)
    }
    
    func testCounterIncrementButton() {
        DashboardPage()
            .tapCounter()
        CounterPage()
            .tapIncrement()
            .verifyCount(matches: 1)
            .tapIncrement(15)
            .verifyCount(matches: 16)
    }
    
    func testCounterDecrementButton() {
        DashboardPage()
            .tapCounter()
        CounterPage()
            .tapIncrement(10)
            .tapDecrement()
            .verifyCount(matches: 9)
            .tapDecrement(5)
            .verifyCount(matches: 4)
    }
    
    
    func testCounterResetButton() {
        DashboardPage()
            .tapCounter()
        CounterPage()
            .tapIncrement()
            .verifyCount(matches: 1)
            .tapReset()
            .verifyCount(matches: 0)
            .tapIncrement(7)
            .verifyCount(matches: 7)
            .tapReset()
            .verifyCount(matches: 0)
    }

}
