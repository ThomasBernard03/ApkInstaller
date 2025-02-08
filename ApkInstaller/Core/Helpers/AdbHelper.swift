//
//  AdbHelper.swift
//  AdbHelper
//
//  Created by Thomas Bernard on 09/04/2024.
//

import Foundation

class AdbHelper {
    
    let adb = Bundle.main.url(forResource: "adb", withExtension: nil)
    
    init() {
        _ = runAdbCommand("root")
    }
    
    
    func installApk(path: URL) -> (success: Bool, message: String) {
        let command = "install \(path.path())"
        return runAdbCommand(command)
    }
    
    private func runAdbCommand(_ command: String) -> (success: Bool, message: String) {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", "\(adb!.path) \(command)"]
        task.launchPath = "/bin/sh"
        task.launch()
        task.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        // Vérifier le code de retour du processus
        let success = (task.terminationStatus == 0)
        
        return (success, output)
    }
}
