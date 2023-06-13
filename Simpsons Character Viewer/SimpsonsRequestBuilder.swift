//
//  SimpsonsRequestBuilder.swift
//  Simpsons Character Viewer
//
//  Created by Tadreik Campbell on 6/13/23.
//

import Foundation

class SimpsonsRequestBuilder: RequestBuilder {
    var host = "api.duckduckgo.com"
    var path: String = "/"
    var queryItems: [URLQueryItem] = [
        URLQueryItem(name: "q", value: "simpsons+characters"),
        URLQueryItem(name: "format", value: "json")
    ]
}
