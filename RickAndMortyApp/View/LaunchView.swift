//
//  LaunchView.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import SwiftUI

struct LaunchView: View{
    @Binding var showLaunchView: Bool
    var body: some View{
        ZStack {
        Color(hex: "#050c1d")
           Image("bcg")
            VStack{
                Image("cartoon_name")
                    .padding(.bottom,20)
                Image("logo")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showLaunchView = false
            }
        }
        .ignoresSafeArea()
    }
}

