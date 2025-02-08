//
//  ContentView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//

import SwiftUI

struct MenuBarExtraContent: View {
    var body: some View {
        VStack {
            Image("AndroidSymbol")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Apk Installer")
            
            Divider()
            
            SettingsLink(label: { Text("Show settings") })
            
            Button("Quit"){
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
    }
}

#Preview {
    MenuBarExtraContent()
}
