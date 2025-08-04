//
//  ContentView.swift
//  CocktailsApp
//
//  Created by Drolllted on 03.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CocktailsViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            vm.setupJSON()
        }
    }
}

#Preview {
    ContentView()
}
