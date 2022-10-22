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
            NavigationLink(destination: CounterView()) {
                Text("Counter")
            }
            .buttonStyle(.bordered)
            .accessibilityIdentifier("DashboardCounterLink")
            .navigationTitle("Sandbox")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
