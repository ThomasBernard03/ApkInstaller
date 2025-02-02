//
//  ApkInstallerApp.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//

import SwiftUI

@main
struct ApkInstallerApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var currentNumber: String = "1"
    
    var body: some Scene {
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            ContentView()
            Button("Quit"){
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
