//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import Foundation

struct EpisodeDetail: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode
    }
}
