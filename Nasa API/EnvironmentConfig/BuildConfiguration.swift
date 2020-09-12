//
//  BuildConfiguration.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

public enum Environment {
    private enum Keys: String {
        case baseURL = "base_url"
        case apiKey = "api_key"
        case logEnabled = "log_enabled"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static var baseURL: String {
        guard let baseURL = Environment.infoDictionary[Keys.baseURL.rawValue] as? String else {
            fatalError("Base URL is not set in plist file for this environment")
        }
        return baseURL
    }
    
    static var apiKey: String {
        guard let apiKey = Environment.infoDictionary[Keys.apiKey.rawValue] as? String else {
            fatalError("Api key is not set in plist file for this environment")
        }
        return apiKey
    }
    
    static var logEnabled: Bool {
        guard let logEnabled = Environment.infoDictionary[Keys.logEnabled.rawValue] as? Bool else {
            fatalError("Log enabled is not set in plist file for this environment")
        }
        return logEnabled
    }
}
