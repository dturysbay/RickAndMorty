//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import Foundation

struct Character:Codable {
    let id: Int
    let name: String
    let status: String
    let image: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let episode: [String]
}

struct CharacterResponse: Codable {
    let results: [Character]
}
