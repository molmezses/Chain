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
                    ChainDetailsView(progress: 23, complete: 100, selectedColor: .customColor10)
                        .navigationBarBackButtonHidden()
                } label: {
                    ChainView(selectedColor: .customColor10, title: "Her gün kitap okuyacağım" ,scor: "23/40" , isCompleted: false , emoji: "📚")
                        .foregroundStyle(Color("primaryColor"))
                }
                NavigationLink {
                    ChainDetailsView(progress: 800, complete: 1300, selectedColor: .customColor2)
                        .navigationBarBackButtonHidden()

                } label: {
                    ChainView(selectedColor: .customColor2, title: "Diyet yapacağım" ,scor: "800/1300" , isCompleted: true ,  emoji: "💧")
                        .foregroundStyle(Color("primaryColor"))
                }
                NavigationLink {
                    ChainDetailsView(progress: 40, complete: 130, selectedColor: .customColor6)
                        .navigationBarBackButtonHidden()

                } label: {
                    ChainView(selectedColor: .customColor6, title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true , emoji: "🚗")
                        .foregroundStyle(Color("primaryColor"))
                }
                NavigationLink {
                    ChainDetailsView(progress: 15, complete: 100, selectedColor: .customColor1)
                        .navigationBarBackButtonHidden()

                } label: {
                    ChainView(selectedColor: .customColor1, title: "Yabancı dil Çalışcağım" ,scor: "1/1" , isCompleted: true, emoji: "💧")
                        .foregroundStyle(Color("primaryColor"))
                }
                NavigationLink {
                    ChainDetailsView(progress: 25, complete: 60, selectedColor: .customColor9)
                        .navigationBarBackButtonHidden()
                } label: {
                    ChainView(selectedColor: .customColor9, title: "Meditasyon yapacağım" ,scor: "15/15" , isCompleted: true, emoji: "🧭")
                        .foregroundStyle(Color("primaryColor"))
                }
                NavigationLink {
                    ChainDetailsView(progress: 40, complete: 130, selectedColor: .customColor4)
                        .navigationBarBackButtonHidden()

                } label: {
                    ChainView(selectedColor: .customColor4, title: "Mekik çekeceğim" ,scor: "10/20" , isCompleted: false, emoji: "💪")
                        .foregroundStyle(Color("primaryColor"))
                }
                
                ChainView(selectedColor: .customColor8, title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true, emoji: "🏀")
                ChainView(selectedColor: .customColor3, title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true, emoji: "🚗")
                ChainView(selectedColor: .customColor4, title: "Mekik çekeceğim" ,scor: "10/20" , isCompleted: false, emoji: "💪")
                ChainView(selectedColor: .customColor5, title: "Meditasyon yapacağım" ,scor: "15/15" , isCompleted: true, emoji: "🧭")
                ChainView(selectedColor: .customColor1, title: "Yabancı dil Çalışcağım" ,scor: "1/1" , isCompleted: true, emoji: "💧")
                ChainView(selectedColor: .customColor6, title: "Yeni kelime ezberleyeceğim" ,scor: "0/200" , isCompleted: true , emoji: "🏀")
               

                
            }
            .navigationTitle("My Chains")
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
