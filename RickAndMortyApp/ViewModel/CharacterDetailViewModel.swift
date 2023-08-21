//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var origin: OriginDetail?
    @Published var episodeDetails: [EpisodeDetail] = []
    
    func fetchEpisodeDetails(from episodeURLs: [String]) {
           for url in episodeURLs {
               guard let episodeURL = URL(string: url) else {
                   continue
               }
               
               URLSession.shared.dataTask(with: episodeURL) { data, response, error in
                   guard let data = data, error == nil else {
                       return
                   }
                   
                   do {
                       let decoder = JSONDecoder()
                       let episodeDetail = try decoder.decode(EpisodeDetail.self, from: data)
                       DispatchQueue.main.async {
                           self.episodeDetails.append(episodeDetail)
                       }
                   } catch {
                       print("Error decoding episode detail:", error)
                   }
               }.resume()
           }
       }
    func fetchOriginDetail(from url: String) {
        guard let originURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: originURL) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let originDetail = try decoder.decode(OriginDetail.self, from: data)
                DispatchQueue.main.async {
                    self.origin = originDetail
                }
            } catch {
                print("Error decoding origin detail:", error)
            }
        }.resume()
    }
}

