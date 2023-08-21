//
//  Components.swift
//  RickAndMortyApp
//
//  Created by Dinmukhambet Turysbay on 21.08.2023.
//

import SwiftUI

struct InfoRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(Color(hex: "#C4C9CE"))
               
            Spacer()
            Text(value)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.horizontal,32)
    }
}

struct TitleLabel: View{
    let label: String
    let size: CGFloat
    
    init(label: String, size: CGFloat = 17) {
        self.label = label
        self.size = size
    }
    var body: some View{
        HStack{
            Text(label)
                .font(.system(size: 17,weight:.semibold))
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .frame(width: 44, height: 44)
                .foregroundColor(.white)
        }
    }
}
