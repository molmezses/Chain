//
//  ChainView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 26.02.2025.
//

import SwiftUI

struct ChainView: View {
    
    let selectedColor: Color
    let completedChain: CGFloat
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Her gün kitap okuyacağım")
                        .font(.callout)
                    Spacer()
                    Text("23/40")
                        .font(.subheadline)
                }
                .padding(.vertical , 4)
                HStack {
                    Spacer()
                    Image(systemName: "flame.fill")
                        .foregroundStyle(selectedColor)
                }
            }
            .padding(8)
            .mask {
                RoundedRectangle(cornerRadius: 12)
            }
            .overlay(
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width * completedChain))
                    .foregroundStyle(selectedColor).frame(height: 3), alignment: .bottomLeading
            )
            .background(selectedColor.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
                
        }
        .padding(8)
    }
}

#Preview {
    ChainView(selectedColor: .customColor2, completedChain: 0.2)
}
