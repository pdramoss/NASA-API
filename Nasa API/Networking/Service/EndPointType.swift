//
//  EndPointType.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]
public typealias HTTPHeaders = [String: String]

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var data: Data? { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get set }
}

extension EndPointType {
    private var environmentBaseURl: String {
        Environment.baseURL
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURl) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    func encode<T>(_ value: T) -> Data? where T : Encodable {
        do {
            return try JSONEncoder().encode(value)
        } catch {
            return nil
        }
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    private var defaultParameters: Parameters? {
        ["api_key": Environment.apiKey]
    }
    
    public var allParameters: Parameters? {
        guard let parameters = self.parameters else {
            return defaultParameters
        }
        return defaultParameters?.merging(parameters) { (_, new) in new }
    }
}
