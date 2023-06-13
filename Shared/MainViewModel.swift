//
//  MainViewModel.swift
//  Simpsons Character Viewer
//
//  Created by Tadreik Campbell on 6/13/23.
//

import UIKit

final class MainViewModel {
    
    weak var tableView: UITableView?
    
    var dataProvider = CharacterDataProvider(requestBuilder: AppDelegate.requestBuilder)
    
    var characters: [RelatedTopic] = []
    var showingChars: [RelatedTopic] = []
    
    init() {
        getMembers()
    }
    
    func getMembers() {
        dataProvider.getCharacterData { [weak self] data in
            guard let self, let data else { return }
            self.characters = data.relatedTopics
            self.showingChars = data.relatedTopics
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    func search(_ text: String) {
        showingChars = characters.filter { $0.text.localizedCaseInsensitiveContains(text) }
        tableView?.reloadData()
    }
    
    func showOriginal() {
        showingChars = characters
        tableView?.reloadData()
    }
}
