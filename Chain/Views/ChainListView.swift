//
//  ChainView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 26.02.2025.
//

import SwiftUI

struct ChainListView: View {
    
    let today = Date()
    func formattedDateDay(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter.string(from: date)
    }
    @State  var progress: Double = 0.23

    
    var body: some View {
        NavigationStack {
            CalendarView()
            Divider()
            ScrollView {
                NavigationLink {
                    
                } label: {
                    ChainView(selectedColor: .customColor10, completedChainProgress: 0.20 , title: "Her gün kitap okuyacağım" ,scor: "23/40" , isCompleted: false , isAcceptBell: true , isCorrectChain: false, emoji: "📚")
                }

               
                ChainView(selectedColor: .customColor2, completedChainProgress: 0.90 , title: "Diyet yapacağım" ,scor: "800/1300" , isCompleted: true , isAcceptBell: false , isCorrectChain: false, emoji: "💧")
                ChainView(selectedColor: .customColor6, completedChainProgress: 1.0 , title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true , isAcceptBell: true , isCorrectChain: true, emoji: "🚗")
                ChainView(selectedColor: .customColor4, completedChainProgress: 0.50 , title: "Mekik çekeceğim" ,scor: "10/20" , isCompleted: false , isAcceptBell: true , isCorrectChain: false, emoji: "💪")
                ChainView(selectedColor: .customColor9, completedChainProgress: 1.0 , title: "Meditasyon yapacağım" ,scor: "15/15" , isCompleted: true, isAcceptBell: true , isCorrectChain: true , emoji: "🧭")
                ChainView(selectedColor: .customColor1, completedChainProgress: 1.0 , title: "Yabancı dil Çalışcağım" ,scor: "1/1" , isCompleted: true, isAcceptBell: true , isCorrectChain: false, emoji: "💧")
                ChainView(selectedColor: .customColor8, completedChainProgress: 1.0 , title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true , isAcceptBell: true , isCorrectChain: true, emoji: "🏀")
                ChainView(selectedColor: .customColor3, completedChainProgress: 1.0 , title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true , isAcceptBell: true , isCorrectChain: true, emoji: "🚗")
                ChainView(selectedColor: .customColor4, completedChainProgress: 0.50 , title: "Mekik çekeceğim" ,scor: "10/20" , isCompleted: false , isAcceptBell: true , isCorrectChain: false, emoji: "💪")
                ChainView(selectedColor: .customColor5, completedChainProgress: 1.0 , title: "Meditasyon yapacağım" ,scor: "15/15" , isCompleted: true, isAcceptBell: true , isCorrectChain: true , emoji: "🧭")
                ChainView(selectedColor: .customColor1, completedChainProgress: 1.0 , title: "Yabancı dil Çalışcağım" ,scor: "1/1" , isCompleted: true, isAcceptBell: true , isCorrectChain: false, emoji: "💧")
                ChainView(selectedColor: .customColor6, completedChainProgress: 1.0 , title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true , isAcceptBell: true , isCorrectChain: true, emoji: "🏀")
               

                
            }
            .navigationTitle("Chain")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundStyle(.white , .indigo)
                        .frame(width: 30 , height: 30)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("\(formattedDateDay(today))")
                }
                
            }
        }
    }
}

#Preview {
    ChainListView()
}
