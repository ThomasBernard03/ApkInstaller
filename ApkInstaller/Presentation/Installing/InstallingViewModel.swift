//
//  InstallingViewModel.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 01/02/2025.
//

import Foundation

extension InstallingView {
    @Observable
    class ViewModel {
        private let logger = AppLogger()
        private let adbHelper = AdbHelper()
        
        var applicationName : String = ""
        var message : String = ""
        var isLoading : Bool = false
        
        
        func installApk(path : URL) async {
            applicationName = path.lastPathComponent
            isLoading = true
            let result = adbHelper.installApk(path: path)
            isLoading = false
            message = result
        }
    }
}
