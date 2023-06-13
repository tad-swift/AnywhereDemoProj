//
//  WireRequestBuilder.swift
//  Wire Character Viewer
//
//  Created by Tadreik Campbell on 6/13/23.
//

import Foundation

class WireRequestBuilder: RequestBuilder {
    var host = "api.duckduckgo.com"
    var path: String = "/"
    var queryItems: [URLQueryItem] = [
        URLQueryItem(name: "q", value: "the+wire+characters"),
        URLQueryItem(name: "format", value: "json")
    ]
}
