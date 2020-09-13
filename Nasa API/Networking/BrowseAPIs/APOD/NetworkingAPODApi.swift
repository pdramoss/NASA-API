//
//  NetworkingAPODApi.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation
enum NetworkingAPODApi {
    case getAPOD(date: String, hd: Bool)
}

extension NetworkingAPODApi: EndPointType {
    var path: String {
        switch self {
        case .getAPOD:
            return "/planetary/apod"
        }
    }
    
    var data: Data? {
        nil
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    var parameters: Parameters? {
        switch self {
        case .getAPOD(let date,let hd):
            return ["date" : date, "hd": hd]
        }
    }
}
