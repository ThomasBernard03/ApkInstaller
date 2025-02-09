//
//  AdbHelper.swift
//  AdbHelper
//
//  Created by Thomas Bernard on 09/04/2024.
//

import Foundation

class AdbHelper {
    
    private let adb = Bundle.main.url(forResource: "adb", withExtension: nil)
    private let logger = FileLogger()
    
    init() {
        _ = runAdbCommand("root")
    }
    
    
    func installApk(path: URL) -> InstallingResult {
        let command = "install \(path.path())"
        let output = runAdbCommand(command)
        
        if(output.success){
            return InstallingResult.installed
        }
        else if (output.message.contains("no devices/emulators found")){
            return InstallingResult.noDeviceConnected
        }
        else {
            return InstallingResult.unknownError(output.message)
        }
    }
    
    private func runAdbCommand(_ command: String) -> (success: Bool, message: String) {
        let startTime = Date()
        
        logger.debug("Running command: \(command)")
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
        
        let success = (task.terminationStatus == 0)
        
        let endTime = Date()
        let executionTime = endTime.timeIntervalSince(startTime) * 1000
        
        logger.debug("Command execution time: \(Int(executionTime)) ms")
        logger.debug("Success: \(success)")
        logger.debug("Output: \(output)")
        
        return (success, output)
    }

}
