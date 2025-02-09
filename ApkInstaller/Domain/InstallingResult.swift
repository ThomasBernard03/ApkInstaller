//
//  InstallingResult.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 09/02/2025.
//

enum InstallingResult {
    case installed
    
    /** Errors **/
    case unknownError(String)
    case noDeviceConnected
}
