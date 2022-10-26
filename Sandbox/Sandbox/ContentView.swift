//
//  ContentView.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView()) {
                    Text("Counter")
                }
                .accessibilityIdentifier("DashboardCounterLink")
                NavigationLink(destination: AccountView().environmentObject(AccountViewModel())
                ) {
                    Text("Account")
                }
                .accessibilityIdentifier("DashboardAccountLink")
            }
            .buttonStyle(.bordered)
            .navigationTitle("Sandbox")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
