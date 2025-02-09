//
//  InstallingStatus.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 02/02/2025.
//

enum InstallingStatus : Equatable {
    case notStarted
    case installing
    case installed
    
    /** Errors **/
    case unknownError(String)
    case noDeviceConnected
}
