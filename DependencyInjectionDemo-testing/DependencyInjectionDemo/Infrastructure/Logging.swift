//
//  Logging.swift
//  DependencyInjectionDemo
//
//  Created by Ben Scheirman on 9/10/20.
//

import Foundation

protocol Logging {
    func log(_ level: LogLevel, _ message: String, file: StaticString, line: UInt)
}

extension Logging {
    func debug(_ message: String, file: StaticString = #file, line: UInt = #line) {
        log(.debug, message, file: file, line: line)
    }
    
    func info(_ message: String, file: StaticString = #file, line: UInt = #line) {
        log(.info, message, file: file, line: line)
    }
    
    func warn(_ message: String, file: StaticString = #file, line: UInt = #line) {
        log(.warn, message, file: file, line: line)
    }
    
    func error(_ message: String, file: StaticString = #file, line: UInt = #line) {
        log(.error, message, file: file, line: line)
    }
}

enum LogLevel {
    case debug
    case info
    case warn
    case error
}
