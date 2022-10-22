//
//  AccountView.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/21/22.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel = AccountViewModel()
    @State var accountsToCreate: String = ""
    @State var emailPrefix: String = ""
    @State var emailDomain: String = ""
    
    var body: some View {
        
        //TODO: Add Search Functionality
        
        VStack {
            List {
                if !viewModel.accounts.isEmpty {
                    ForEach(viewModel.accounts, id: \.id) { account in
                        AccountListItemView(account: account)
                            .accessibilityIdentifier("AccountView-\(account.email)")
                    }
                    .onDelete(perform: viewModel.deleteRow)
                } else {
                    Text("Create an account to continue...")
                }
            }
            .accessibilityIdentifier("AccountList")
            VStack {
                HStack {
                    TextField("Prefix", text: $emailPrefix)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .accessibilityIdentifier("AccountPrefixTextField")
                    TextField("Domain", text: $emailDomain)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .accessibilityIdentifier("AccountDomainTextField")
                }
                .padding(.horizontal, 25)
                HStack {
                    Spacer()
                    TextField("Quantity", text: $accountsToCreate)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 50)
                        .multilineTextAlignment(.center)
                        .accessibilityIdentifier("AccountQuantityTextField")
                    Button {
                        viewModel.createAccount(quantity: accountsToCreate, emailPrefix: emailPrefix, domain: emailDomain)
                        accountsToCreate = ""
                    } label: {
                        Text("Create Account")
                            .accessibilityIdentifier("AccountCreateButtonLabel")
                    }
                    .buttonStyle(.bordered)
                    .accessibilityIdentifier("AccountCreateButton")
                    Button {
                        emailPrefix = ""
                        emailDomain = ""
                        viewModel.clear()
                    } label: {
                        Text("Clear")
                    }
                    .buttonStyle(.bordered)
                    .accessibilityIdentifier("AccountClearButton")
                    Spacer()
                }
            }
        }
        .navigationTitle("Account")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
