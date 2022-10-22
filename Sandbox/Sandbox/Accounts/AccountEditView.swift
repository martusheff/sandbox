//
//  AccountEditView.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/22/22.
//

import SwiftUI

struct AccountEditView: View {
    @ObservedObject var account: AccountModel
    @State var newEmail: String = ""
    @State var newPassword: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Edit Account")
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
                .accessibilityIdentifier("AccountEditPageTitle")
            Form {
                Section(header: Text("Email").accessibilityIdentifier("AccountEditEmailHeader")) {
                    TextField(account.email, text: $newEmail)
                        .accessibilityIdentifier("AccountEditEmailTextField")
                }
                Section(header: Text("Password").accessibilityIdentifier("AccountEditPasswordHeader")) {
                    TextField(account.password, text: $newPassword)
                        .accessibilityIdentifier("AccountEditPasswordTextField")
                }
                Section(header: Text("Flag")) {
                    Rectangle()
                        .frame(height: 10)
                        .cornerRadius(5)
                        .foregroundColor(account.flag ? Color.green : Color.red)
                        .opacity(0.35)
                        .onTapGesture {
                            account.flag.toggle()
                        }
                        .accessibilityIdentifier("AccountEditFlagIndicator")
                }
            }
            Spacer()
            Button {
                if !newEmail.isEmpty {
                    account.email = newEmail
                }
                if !newPassword.isEmpty {
                    account.password = newPassword
                }
            } label: {
                Text("Update")
                    .accessibilityIdentifier("AccountEditUpdateButtonLabel")
            }
            .buttonStyle(.bordered)
            .accessibilityIdentifier("AccountEditUpdateButton")
        }
    }
}
