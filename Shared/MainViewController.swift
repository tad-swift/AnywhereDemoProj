//
//  MainViewController.swift
//  Simpsons Character Viewer
//
//  Created by Tadreik Campbell on 6/12/23.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let v = UISearchBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        return v
    }()
    
    lazy var tableView: UITableView = {
        let v = UITableView(frame: .zero, style: .plain)
        v.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.register(ResultCell.self, forCellReuseIdentifier: ResultCell.reuseID)
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        viewModel.tableView = tableView
        view.addSubviews(searchBar, tableView)
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.showingChars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.reuseID, for: indexPath) as! ResultCell
        let model = viewModel.showingChars[indexPath.item]
        cell.titleLabel.text = model.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.showingChars[indexPath.item]
        let vc = DetailController(title: "Character Info", cast: item)
        showDetailViewController(vc, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - SearchBar Delegate
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmpty {
            viewModel.search(text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.showOriginal()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trimmingCharacters(in: .whitespaces).isEmpty {
            viewModel.showOriginal()
        }
    }
}
