//
//  RickAndMortyViewController.swift
//  Rick and Morty
//
//  Created by M I C H A E L on 06.05.2023.
//

import UIKit


enum Link {
    case rickAndMortyURL
    
    var url: URL {
        switch self {
        case .rickAndMortyURL:
            return URL(string: "https://rickandmortyapi.com/api/character/105")!
        }
    }
}

final class RickAndMortyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        fetchRickAndMorty()
    }
    
    private func fetchRickAndMorty() {
        URLSession.shared.dataTask(with: Link.rickAndMortyURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let rickAndMorty = try decoder.decode(RickAndMorty.self, from: data)
                print(rickAndMorty)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
