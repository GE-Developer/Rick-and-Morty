//
//  RickAndMorty.swift
//  RickAndMorty
//
//  Created by M I C H A E L on 06.05.2023.
//

import Foundation

struct RickAndMorty: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let location: Location
    let image: URL
    let created: String
}

struct Location: Decodable {
    let name: String
    let url: URL
}
