//
//  AccountView.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/21/22.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    @State var accountsToCreate: String = ""
    @State var emailPrefix: String = ""
    @State var emailDomain: String = ""
    @State var scale = 0.9
    @State var searchField: String = ""
    @State var totalAccounts: Int = 0
    
    var body: some View {
        
        //TODO: Debug nabar count on search.
        //TODO: Add UI tests for search functionality.
        //TODO: ADD UnitTests for View Model functions.
        
        VStack {
            if viewModel.numAccounts > 0 {
                SearchFieldView(searchEntry: $searchField, searchResults: $totalAccounts)
                    .scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 0.75)
                        withAnimation() {
                            scale = 1.0
                        }
                        
                    }
                    .padding(.bottom, 15)
            }
            List {
                if !viewModel.accounts.isEmpty &&  searchField.isEmpty {
                    ForEach(viewModel.accounts, id: \.id) { account in
                        AccountListItemView(account: account)
                            .accessibilityIdentifier("AccountView-\(account.email)")
                    }
                    .onDelete(perform: viewModel.deleteRow)
                } else if !viewModel.accounts.isEmpty {
                    ForEach(viewModel.accounts, id: \.id) { account in
                        if account.email.contains(searchField) {
                            AccountListItemView(account: account)
                                .accessibilityIdentifier("AccountView-\(account.email)")
                        }
                    }
                    .onDelete(perform: viewModel.deleteRow)
                    
                } else {
                    Text("Create an account to continue...")
                }
            }
            .padding(.top, -25)
            .accessibilityIdentifier("AccountList")
            
            
            ZStack {
                VStack(spacing: 15) {
                    HStack {
                        VStack {
                            TextField("Quantity", text: $accountsToCreate)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.center)
                                .accessibilityIdentifier("AccountQuantityTextField")
                        }
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
                        Button {
                            viewModel.createAccount(quantity: accountsToCreate, emailPrefix: emailPrefix, domain: emailDomain)
                            accountsToCreate = ""
                            if searchField.isEmpty {
                                totalAccounts = viewModel.numAccounts
                            } else {
                                totalAccounts = viewModel.accounts.filter({ $0.email.contains(searchField)}).count
                            }
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
                            totalAccounts = viewModel.numAccounts
                        } label: {
                            Text("Clear")
                        }
                        .buttonStyle(.bordered)
                        .accessibilityIdentifier("AccountClearButton")
                        Spacer()
                    } // HSTACK
                    
                    
                }// VSTACK

                .zIndex(2)
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width + 20, height: UIScreen.main.bounds.height / 10)
                    
                    .zIndex(1)
                    .foregroundColor(.white)
                    .offset(y: -25)
            }//ZSTACK
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Accounts")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(totalAccounts)")
                            .accessibilityIdentifier("AccountCountLabel")
                            .padding(.horizontal, 15)
                            .padding(.bottom, -5)
                            
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
