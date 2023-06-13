//
//  CharacterDataProvider.swift
//
//  Created by Tadreik Campbell on 6/13/23.
//

import Foundation

final class CharacterDataProvider<T: RequestBuilder, V: NetworkService> {
    
    private var requestBuilder: T
    private var networkService: V
    
    init(requestBuilder: T, networkService: V = URLSession.shared) {
        self.requestBuilder = requestBuilder
        self.networkService = networkService
    }
    
    func getCharacterData(completion: @escaping (CharacterData?) -> Void) {
        requestBuilder.performRequest(on: networkService) { data, error in
            var characterData: CharacterData? = nil
            defer {
                completion(characterData)
            }
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    characterData = try JSONDecoder().decode(CharacterData.self, from: data)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
    }
}
