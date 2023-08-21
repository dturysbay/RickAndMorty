//
//  CharacterViewModel.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    init() {
        fetchCharacters()
    }

    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    self.characters = decodedResponse.results
                    print("Character \(self.characters)")
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
