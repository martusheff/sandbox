//
//  AccountListItemView.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/22/22.
//

import SwiftUI

struct AccountListItemView: View {
    @ObservedObject var account: AccountModel
    @State var showEditSheet: Bool = false
    
    var body: some View {
        VStack {
            Text(account.email)
                .accessibilityIdentifier("AccountEmailLabel-\(account.email)")
            Rectangle()
                .frame(height: 10)
                .cornerRadius(5)
                .foregroundColor(account.flag ? Color.green : Color.red)
                .opacity(0.35)
                .accessibilityIdentifier("AccountFlagIndicator-\(account.email)")
        }
        .onTapGesture {
            account.flag.toggle()
        }
        .onLongPressGesture(perform: {
            showEditSheet.toggle()
        })
        .sheet(isPresented: $showEditSheet) {
            AccountEditView(account: account)
        }
    }
    
}
