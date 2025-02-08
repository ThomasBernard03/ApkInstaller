//
//  SettingsView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//

import SwiftUI
import Sparkle

struct SettingsView: View {
    
    let updater : SPUUpdater
    
    var body: some View {
        TabView {
            Tab("General", systemImage: "gear") {
                GeneralSettingsView(updater:updater)
            }
//            Tab("Advanced", systemImage: "star") {
////                AdvancedSettingsView()
//                Text("Help")
//            }
        }
        .scenePadding()
        .frame(maxWidth: 350, minHeight: 100)
    }
}
