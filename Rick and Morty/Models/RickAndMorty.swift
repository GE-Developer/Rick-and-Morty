//
//  RickAndMorty.swift
//  RickAndMorty
//
//  Created by M I C H A E L on 06.05.2023.
//

import Foundation

struct RickAndMorty: Decodable {
    let results: [Personage]
}

struct Personage: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}
