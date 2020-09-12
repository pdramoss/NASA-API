//
//  DefaultNetworkManager.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

protocol DefaultNetworkManagerProtocol {
    func handleNetwork(_ response: HTTPURLResponse) -> Result<Bool, Error>
}

class DefaultNetworkManager: DefaultNetworkManagerProtocol {
    
    func load<T: Decodable> (data: Data?, as type: T.Type = T.self) throws -> T {
        guard let data = data else { throw ErrorNetworking.noData }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ErrorNetworking.unableToDecode
        }
    }
    
    func handleNetwork(_ response: HTTPURLResponse) -> Result<Bool, Error> {
        switch response.statusCode {
        case 200...299: return .success(true)
        case 401...500: return .failure(ErrorNetworking.authenticationError)
        case 501...599: return .failure(ErrorNetworking.badRequest)
        case 600: return .failure(ErrorNetworking.outdated)
        default: return .failure(ErrorNetworking.failed)
        }
    }
}
