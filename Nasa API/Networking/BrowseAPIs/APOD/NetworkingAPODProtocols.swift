//
//  NetworkingAPODProtocols.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

protocol NetworkingAPODAdapterProtocol {
    func getAPOD(date: String, hd: Bool, completion: @escaping(Result<EntityAPOD, Error>) -> Void) 
}
