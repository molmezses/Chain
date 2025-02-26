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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView()
                ChainView(selectedColor: .customColor1, completedChain: 0.20)
                ChainView(selectedColor: .customColor2, completedChain: 0.90)
                ChainView(selectedColor: .customColor9, completedChain: 0.20)
                ChainView(selectedColor: .customColor6, completedChain: 0.90)
                ChainView(selectedColor: .customColor7, completedChain: 0.20)
                ChainView(selectedColor: .customColor10, completedChain: 0.90)
                
            }
            .navigationTitle("\(formattedDateDay(today))")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

#Preview {
    ChainListView()
}
