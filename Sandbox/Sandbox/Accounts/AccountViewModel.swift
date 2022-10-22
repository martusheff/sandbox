//
//  AccountViewModel.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/21/22.
//

import Foundation

class AccountViewModel: ObservableObject {
    @Published var accounts: [AccountModel] = []
    
    func createAccount(quantity: String, emailPrefix: String, domain: String) {
        let prefixToUse = emailPrefix.isEmpty ? "SandboxTest" : emailPrefix
        let domainToUse = domain.isEmpty ? "email" : domain
        let quantityToUse = quantity.isEmpty ? "1" : quantity
        
        let number = Int(quantityToUse)!
        for _ in 1...number {
            let newAccount = AccountModel(email: email(emailPrefix: prefixToUse, domain: domainToUse), password: password())
            accounts.append(newAccount)
        }
    }
    
    func clear() {
        accounts = []
    }
    
    func toggleFlag(for account: AccountModel) {
        account.flag.toggle()
    }
    
    func email(emailPrefix: String, domain: String) -> String {
        return emailPrefix + UUID().uuidString.components(separatedBy: "-").first! + "@\(domain).com"
    }
    
    func password() -> String {
        return UUID().uuidString.components(separatedBy: "-").first!
    }
    
    func deleteRow(at indexSet: IndexSet) {
        accounts.remove(atOffsets: indexSet)
    }
}
