//
//  ContentView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Quit"){
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
