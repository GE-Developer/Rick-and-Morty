//
//  RickAndMortyListViewController.swift
//  Rick and Morty
//
//  Created by M I C H A E L on 10.05.2023.
//

import UIKit

final class RickAndMortyListViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    
    private var personages: [Personage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 13
        fetchRickAndMorty()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
       
        content.text = personages[indexPath.row].name
        content.secondaryText = personages[indexPath.row].species
        
        cell.contentConfiguration = content
        return cell
    }
    

    private func fetchRickAndMorty() {
        networkManager.fetch(RickAndMorty.self,
                             from: Link.rickAndMorty.url) { [weak self] result in
            switch result {
            case .success(let rickAndMorty):
                print(rickAndMorty)
                self?.personages = rickAndMorty.results
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
