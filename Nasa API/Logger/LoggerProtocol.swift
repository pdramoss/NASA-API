//
//  LoggerProtocol.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

enum LoggerEvent: String {
    case error = "‼️" // error
    case info = "💬" // debug
    case warning = "⚠️" // warning
}

protocol LoggerProtocol {
    // Log error message
    static func error(_ object: Any, filename: String, functionName: String)
    
    // Log debug message
    static func info(_ object: Any, filename: String, functionName: String)
    
    // Log warning message
    static func warning(_ object: Any, filename: String, functionName: String)
}

extension LoggerProtocol {
    private static var isLoggingEnabled: Bool {
        return Environment.logEnabled
    }
    
    static func print(_ info: String, with object: Any) {
        if isLoggingEnabled {
            Swift.print(info, object)
        }
    }
    
    static func sourceFileName(filePath: String) -> String {
        return FileManager.default.displayName(atPath: filePath)
    }
}
