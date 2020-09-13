//
//  NetworkingRouter.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

public typealias CompletionData = (Data?, HTTPURLResponse?, Error?)
public typealias NetworkRouterCompletion = (_ data: Data?, _ response: HTTPURLResponse?, _ error: Error?) -> Void

protocol NetworkingRouterProtocol: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class NetworkingRouter<EndPoint: EndPointType>: NetworkingRouterProtocol {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        var urlRequest = URLRequest(
            url: route.baseURL.appendingPathComponent(route.path),
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 10.0)
        urlRequest.httpMethod = route.httpMethod.rawValue
        urlRequest.httpBody = route.httpMethod == .get ? nil : route.data
        if route.httpMethod == .get {
            var newURL = URLComponents(string: urlRequest.url?.absoluteString ?? String())
            newURL?.queryItems = route.allParameters?.map({ (key: String, value: Any) -> URLQueryItem in
                URLQueryItem(name: key, value: "\(value)")
            })
            urlRequest.url = newURL?.url
        }
        
        NetworkingLogger.log(request: urlRequest)
        self.task = session.dataTask(with: urlRequest, completionHandler: { completion($0, $1  as? HTTPURLResponse, $2) })
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
}
