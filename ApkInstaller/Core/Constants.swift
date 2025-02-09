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

}
