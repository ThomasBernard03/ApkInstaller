//
//  ContentView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//

import SwiftUI

struct MenuBarExtraContent: View {
    
    @AppStorage("installCount") var installCount: Int = 0
    
    var body: some View {
        VStack {
            Image("AndroidSymbol")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Apk Installer")
            Text("\(installCount) Apk installed")
            
            
            
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
