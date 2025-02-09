//
//  Logger.swift
//  AndroidTools
//
//  Created by Thomas Bernard on 29/01/2025.
//


protocol Logger {
    func debug(_ message: String, file: String, function: String, line: Int)
    func info(_ message: String, file: String, function: String, line: Int)
    func warning(_ message: String, file: String, function: String, line: Int)
    func error(_ message: String, file: String, function: String, line: Int)
}

//extension Logger {
//    func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
//        debug(message, file: file, function: function, line: line)
//    }
//    
//    func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
//        info(message, file: file, function: function, line: line)
//    }
//    
//    func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
//        warning(message, file: file, function: function, line: line)
//    }
//    
//    func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
//        error(message, file: file, function: function, line: line)
//    }
//}
