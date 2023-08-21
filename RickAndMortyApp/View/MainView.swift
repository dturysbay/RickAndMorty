//
//  MainView.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import SwiftUI

struct MainView: View{
    var characterViewModel:CharacterViewModel
    
    var body: some View{
        NavigationView{
            ZStack {
              Color(hex: "#050c1d").ignoresSafeArea()
               
               VStack(alignment: .leading, spacing: 20) {
                   TitleLabel(label: "Characters",size: 28)
                   .padding(.bottom,20)
                   
                   ScrollView {
                       LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                           ForEach(characterViewModel.characters, id: \.id) { character in
                               NavigationLink(destination: CharacterDetailView(character: character)) {
                                   VStack {
                                       AsyncImage(url: URL(string: character.image)!){ phase in
                                           if let image = phase.image{
                                               image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                           }
                                       }
                                           .frame(width: 140, height: 140)
                                           .cornerRadius(8)

                                       Text(character.name)
                                           .font(.caption)
                                           .foregroundColor(.white)
                                           .multilineTextAlignment(.center)
                                           .lineLimit(2)
                                           .frame(width: 100)
                                   }
                               }
                           }
                       }
                       .padding()
                   }
                   
                   Spacer()
               }
               .padding()
           }
            
        }
    }
}
