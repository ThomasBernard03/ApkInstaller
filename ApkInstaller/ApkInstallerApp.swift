//
//  ApkInstallerApp.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//

import SwiftUI
import Sparkle

@main
struct ApkInstallerApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let updaterController: SPUStandardUpdaterController
    
    init() {
         // If you want to start the updater manually, pass false to startingUpdater and call .startUpdater() later
         // This is where you can also pass an updater delegate if you need one
         updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)
     }
    
    @State private var hiddenMenu: Bool = false
    
    var body: some Scene {
        MenuBarExtra("", isInserted: $hiddenMenu) {
          EmptyView()
        }
        .commands {
            CommandGroup(after: .appInfo) {
                GeneralSettingsView(updater: updaterController.updater)
            }
        }
    }
}
