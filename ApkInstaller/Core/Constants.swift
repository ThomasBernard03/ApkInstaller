//
//  Constants.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 09/02/2025.
//

import Foundation
import SwiftyBeaver

class Constants {
    static let logDirectory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Logs/ApkInstaller")
    
    static let swiftyLogger = SwiftyBeaver.self
    static let swiftyFileDestination = FileDestination()
    
    static let applicationVersion = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "-"

    
    static func openLogsFolder() {
        let path = Constants.swiftyFileDestination.logFileURL?.path() ?? ""
        let task = Process()
        task.launchPath = "/usr/bin/open"
        task.arguments = [path]
        task.launch()
    }
}
