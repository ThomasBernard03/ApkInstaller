//
//  InstallingViewModel.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 01/02/2025.
//

import Foundation
import SwiftUI

extension InstallingView {
    
    
    @Observable
    class ViewModel {
        private let logger = FileLogger()
        private let adbHelper = AdbHelper()
        
        var applicationName : String = ""
        var message : String = ""
        var status : InstallingStatus = InstallingStatus.notStarted
        
        
        
        func installApk(path : URL) async {
            applicationName = path.lastPathComponent
            status = InstallingStatus.installing
            let result = adbHelper.installApk(path: path)
            switch(result){
                
            case .installed:
                status = InstallingStatus.installed
            case .unknownError(let message):
                status = InstallingStatus.unknownError(message)
            case .noDeviceConnected:
                status = InstallingStatus.noDeviceConnected
            }
        }
    }
}
