//
//  CharacterDetail.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import SwiftUI

struct CharacterDetailView:View{
    @ObservedObject var characterDetailViewModel = CharacterDetailViewModel()
    let character: Character
    
    var body: some View{
        ZStack{
            Color(hex: "#050c1d").ignoresSafeArea()
            VStack{
                AsyncImage(url: URL(string: character.image)!){ phase in
                    if let image = phase.image{
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .frame(width: 148, height: 148)
                .cornerRadius(16)
                .padding(.bottom,10)
                
                Text(character.name)
                    .foregroundColor(.white)
                    .font(.system(size: 22,weight: .bold))
                    .font(.system(.title3))
                
                Text(character.status)
                    .foregroundColor(Color(hex: "#47C60B"))
                    .padding(.bottom,20)
               
                ScrollView(.vertical){
                    Group{
                        TitleLabel(label: "Info")

                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#262A38"))
                            .frame(height: 120)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                VStack {
                                    InfoRow(label: "Species", value: character.species)
                                        .padding(.vertical,5)
                                    InfoRow(label: "Type", value: character.type.isEmpty ? "None" : character.type)
                                        .padding(.vertical,5)
                                    InfoRow(label: "Gender", value: character.gender)
                                        .padding(.vertical,5)
                                }
                                .foregroundColor(.white)
                            )
                            .padding(.bottom,10)
                    }
                    .padding(.horizontal)
                    
                    Group{
                        TitleLabel(label:"Origin")
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#262A38"))
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                HStack(alignment:.center){

                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width:64,height: 64)
                                            .background(Color(hex: "#191C2A"))
                                            .overlay {
                                                Image("planet")
                                            }
                                            .padding(.leading,10)

                                    VStack(alignment: .leading){
                                        Group{
                                            if let origin = characterDetailViewModel.origin {
                                                Text(origin.name)
                                                    .font(.system(.title3))
                                                    .font(.system(size: 22,weight: .semibold))
                                                    .foregroundColor(.white)
                                                    .padding(.bottom,10)
                                                Text(origin.type)
                                                    .font(.system(size: 13,weight: .semibold))
                                                    .foregroundColor(Color(hex: "#47C60B"))
                                            }
                                        }
                                    }
                                    .padding(.leading,10)
                                    Spacer()
                                }
                            )
                            .padding(.bottom,10)
                    }
                    .padding(.horizontal)
                    
                    Group{
                        TitleLabel(label:"Episodes")
                        if !characterDetailViewModel.episodeDetails.isEmpty {
                            ForEach(characterDetailViewModel.episodeDetails, id: \.id) { episode in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(Color(hex: "#262A38"))
                                    VStack(alignment: .leading) {
                                        Text(episode.name)
                                            .font(.system(size: 17,weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.bottom,10)
                                        HStack{
                                            Text(episode.episode.formatEpisodeString())
                                                .font(.system(size: 13))
                                                .foregroundColor(Color(hex: "#47C60B"))
                                            Spacer()
                                            Text(episode.airDate)
                                                .font(.system(size: 13))
                                                .foregroundColor(Color(hex: "#93989C"))
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    
                    .padding(.horizontal)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
        }
        .onAppear {
            if character.origin.url != ""{
                characterDetailViewModel.fetchOriginDetail(from: character.origin.url)
            }
            if !character.episode.isEmpty{
                characterDetailViewModel.fetchEpisodeDetails(from: character.episode)
            }
        }
    }
}
