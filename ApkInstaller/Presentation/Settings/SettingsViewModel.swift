//
//  SettingsViewModel.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 05/02/2025.
//

import Foundation
import Sparkle


final class SettingsViewModel: ObservableObject {
    @Published var canCheckForUpdates = false

    init(updater: SPUUpdater) {
        updater.publisher(for: \.canCheckForUpdates)
            .assign(to: &$canCheckForUpdates)
    }
}
