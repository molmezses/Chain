//
//  CircularProgressView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 27.02.2025.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: Double // 0.0 ile 1.0 arasında bir değer (%0 - %100)
    var progressColor: Color = .indigo

    
    var body: some View {
        ZStack {
            // Boş çember (arka plan)
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 6)
            
            // Dolan çember (progres bar)
            Circle()
                .trim(from: 0.0, to: progress) // Trim ile belirli bir kısmı çiz
                .stroke(progressColor, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                .rotationEffect(.degrees(-90)) // Üstten başlamasını sağla
            
            // Yüzde metni
            Text("\(Int(progress * 100))%")
                .font(.headline)
                .fontWeight(.bold)
        }
        .frame(width: 60, height: 60)
        .animation(.easeInOut(duration: 0.5), value: progress) // Animasyon
    }
}


#Preview {
    CircularProgressView(progress: 1.0)
}




