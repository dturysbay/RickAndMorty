//
//  Extension+String.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import SwiftUI

extension String {
    func formatEpisodeString() -> String {
        let pattern = #"S(\d+)E(\d+)"#
        
        if let range = self.range(of: pattern, options: .regularExpression) {
            let season = String(self[range].dropFirst(1).prefix(2))
            let episode = String(self[range].dropFirst(4).prefix(2))
            
            let formattedSeason = season.first == "0" ? String(season.dropFirst()) : season
            let formattedEpisode = episode.first == "0" ? String(episode.dropFirst()) : episode
            
            return "Episode \(formattedEpisode), Season \(formattedSeason)"
        }
        
        return self
    }
}
