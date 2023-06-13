//
//  RequestBuilder.swift
//  
//
//  Created by Tadreik Campbell on 6/13/23.
//

import Foundation

public protocol RequestBuilder: AnyObject {
    var host: String { get set }
    var path: String { get set }
    var queryItems: [URLQueryItem] { get set }
}

public extension RequestBuilder {
    var finalURL: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    func appendQueryItem(_ queryItem: URLQueryItem) {
        queryItems.append(queryItem)
    }
    
    func performRequest<N: NetworkService>(on service: N, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = finalURL else {
            let error = NSError(domain: "RequestBuilder", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(nil, error)
            return
        }
        
        let request = URLRequest(url: url)
        let task = service.dataTask(with: request) { data, _, error in
            completion(data, error)
        }
        task.resume()
    }
}
