//
//  ErrorNetwoking.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

enum ErrorNetworking: Error, LocalizedError {
    case authenticationError
    case badRequest
    case outdated
    case failed
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .authenticationError: return "You need to be authenticated first."
        case .badRequest: return "Bad request"
        case .outdated: return "The url you requested is outdated."
        case .failed: return "Network request failed."
        case .noData: return "Response returned with no data to decode."
        case .unableToDecode: return "We could not decode the response."
        }
    }
}
