//
//  CharacterData.swift
//  Simpsons Character Viewer
//
//  Created by Tadreik Campbell on 6/13/23.
//

import Foundation

struct CharacterData: Codable {
    let relatedTopics: [RelatedTopic]
    
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

struct RelatedTopic: Codable {
    let firstURL: String?
    let icon: Icon?
    let result: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

struct Icon: Codable {
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "URL"
        
    }
}
