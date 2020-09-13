//
//  NetworkingAPOAdapter.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

class NetworkingAPODAdapter: DefaultNetworkManager, NetworkingAPODAdapterProtocol {
    private let router = NetworkingRouter<NetworkingAPODApi>()
    
    func getAPOD(date: String, hd: Bool, completion: @escaping (Result<EntityAPOD, Error>) -> Void) {
        router.request(.getAPOD(date: date, hd: hd)) { [weak self] (data, response, error) in
            guard let self = self, let response = response, error == nil else {
                completion(.failure(ErrorNetworking.badRequest))
                return
            }
            
            let result = self.handleNetwork(response)
            switch result {
            case .success:
                do {
                    let response: EntityAPOD = try self.load(data: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
