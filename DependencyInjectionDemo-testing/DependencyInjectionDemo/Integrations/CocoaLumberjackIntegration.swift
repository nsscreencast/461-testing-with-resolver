//
//  CocoaLumberjackIntegration.swift
//  DependencyInjectionDemo
//
//  Created by Ben Scheirman on 9/10/20.
//

import Foundation
import CocoaLumberjackSwift

class CocoaLumberjackIntegration: Logging {
    init() {
        DDLog.sharedInstance.add(DDOSLogger.sharedInstance)
    }
    
    func log(_ level: LogLevel, _ message: String, file: StaticString, line: UInt) {
        switch level {
        case .debug: DDLogDebug(message, file: file, line: line)
        case .info: DDLogInfo(message, file: file, line: line)
        case .warn: DDLogWarn(message, file: file, line: line)
        case .error: DDLogError(message, file: file, line: line)
        }
    }
}
