//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showLaunchView = true
    @ObservedObject var characterViewModel = CharacterViewModel()
    
    var body: some View {
        if showLaunchView{
            LaunchView(showLaunchView: $showLaunchView)
        }else{
            MainView(characterViewModel: characterViewModel)
        }
    }
}
