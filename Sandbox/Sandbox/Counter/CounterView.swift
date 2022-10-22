//
//  CounterView.swift
//  Sandbox
//
//  Created by Andronick Martusheff on 10/21/22.
//

import SwiftUI

struct CounterView: View {
    
    @ObservedObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("Count \(viewModel.count)")
                .accessibilityIdentifier("CountText")
            
            Button {
                viewModel.incrementCount()
            } label: {
                Text("Icrement")
                    .accessibilityIdentifier("CountIncrementButton")
            }
            .buttonStyle(.bordered)
            
            Button {
                viewModel.decrementCount()
            } label: {
                Text("Decrement")
                    .accessibilityIdentifier("CountDecrementButton")
            }
            .buttonStyle(.bordered)
            
            Button {
                viewModel.resetCount()
            } label: {
                Text("Reset")
                    .accessibilityIdentifier("CountResetButton")
            }
            .buttonStyle(.bordered)


        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
