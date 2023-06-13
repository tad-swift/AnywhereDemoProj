//
//  NetworkService.swift
//  
//
//  Created by Tadreik Campbell on 6/13/23.
//

import Foundation

public protocol NetworkService: AnyObject {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
