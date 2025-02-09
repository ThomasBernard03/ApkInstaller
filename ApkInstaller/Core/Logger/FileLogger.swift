import OSLog
import SwiftyBeaver

struct FileLogger : Logger {
    
    init(){
        Constants.swiftyLogger.addDestination(Constants.swiftyFileDestination)
    }
    
    func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Constants.swiftyLogger.debug(message, file: file, function: function, line: line)
    }

    func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Constants.swiftyLogger.info(message, file: file, function: function, line: line)
    }

    func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Constants.swiftyLogger.warning(message, file: file, function: function, line: line)
    }

    func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Constants.swiftyLogger.error(message, file: file, function: function, line: line)
    }
}
