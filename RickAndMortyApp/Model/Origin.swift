//
//  Origin.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import Foundation

struct Origin:Codable{
    let name: String
    let url: String
}

struct OriginDetail: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
}
