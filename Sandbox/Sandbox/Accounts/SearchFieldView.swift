//
//  SearchFieldView.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/25/22.
//

import SwiftUI

struct SearchFieldView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    
    @Binding var searchEntry: String
    @Binding var searchResults: Int
    
    var body: some View {
        ZStack {
            TextField("Search", text: $searchEntry)
                .textFieldStyle(.roundedBorder)
                .padding()
            ZStack {
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal, 25)
                        .foregroundColor(Color.black.opacity(0.7))
                        .onTapGesture {
                            searchResults = viewModel.accounts.filter({ $0.email.contains(searchEntry)}).count
                        }
                }
                    
            }
        }
    }
}
