//
//  CounterViewModel.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation
import SwiftUI

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
    
    func incrementCount() {
        self.count += 1
    }
    
    func decrementCount() {
        self.count = self.count - 1 < 0 ? 0 : self.count - 1
    }
    
    func resetCount() {
        self.count = 0
    }
}
