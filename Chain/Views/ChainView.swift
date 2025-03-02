//
//  ChainView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 26.02.2025.
//

import SwiftUI

struct ChainView: View {
    
    let selectedColor: Color
    let title: String
    let scor: String
    let isCompleted: Bool
    @Environment(\.colorScheme) var colorScheme
    let emoji: String


    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("\(title)")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(scor)")
                        .font(.title2)
                        .bold()
                }
                HStack(spacing: 12){
                    Text("\(emoji)")
                        .font(.title)
                        .foregroundStyle(.gray)
                    Spacer()
                    Image(systemName:"checkmark.circle.fill")
                        .imageScale(.large)
                        .foregroundStyle(colorScheme == .dark ? .black : .black , colorScheme == .light ? .white : selectedColor)
                        .bold()
                        .opacity(isCompleted ? 1 : 0)

                }
            }
            .padding(.trailing, 4)
            .padding(4)
            .padding(.leading , 12)
            .mask {
                RoundedRectangle(cornerRadius: 12)
            }
            .background(colorScheme == .light ? selectedColor.opacity(0.8) : .gray.opacity(0.2))
            .overlay(alignment: .leading, content: {
                if colorScheme == .dark {
                    Rectangle()
                        .frame(width:4)
                        .foregroundStyle(colorScheme == .dark ? selectedColor : selectedColor)
                }
            })
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal, 10)
            .padding(.vertical , 4)
        }
        .padding(.horizontal,8)
    }
}

#Preview {
    ChainView(selectedColor: .customColor2, title: "Hergün kitap okuyacağım", scor: "23/40", isCompleted: true,  emoji: "📚")
}
