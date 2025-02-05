//
//  GeneralSettingsView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//
import SwiftUI
import Sparkle

// https://sparkle-project.org/documentation/programmatic-setup/
struct GeneralSettingsView: View {
    @AppStorage("launchAtLogin") private var launchAtLogin = true
    @AppStorage("fontSize") private var fontSize = 12.0
    
    @ObservedObject private var checkForUpdatesViewModel: SettingsViewModel
    private let updater: SPUUpdater
    
    init(updater: SPUUpdater) {
        self.updater = updater
        
        // Create our view model for our CheckForUpdatesView
        self.checkForUpdatesViewModel = SettingsViewModel(updater: updater)
    }


    var body: some View {
        Form {
            Toggle("Launch at login", isOn: $launchAtLogin)
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            Text("Version \(appVersion ?? "-")")
            Button(
                action: updater.checkForUpdates,
                label: {
                    Text("Check for updates")
                }
            )
            .disabled(!checkForUpdatesViewModel.canCheckForUpdates)

        }
    }
}

//#Preview {
//    GeneralSettingsView()
//}

