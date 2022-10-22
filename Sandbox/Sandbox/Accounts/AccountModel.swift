//
//  AccountModel.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation
import SwiftUI

class AccountModel: Identifiable, ObservableObject {
    var id: String
    var email: String
    var password: String
    @Published var flag: Bool
    
    init(id: String = UUID().uuidString, email: String, password: String, flag: Bool = false) {
        self.id = id
        self.email = email
        self.password = password
        self.flag = flag
    }
}
