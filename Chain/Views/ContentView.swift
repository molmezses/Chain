//
//  ContentView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 24.02.2025.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                RiveViewModel(fileName: "shapes").view()
                    .ignoresSafeArea()
                    .blur(radius: 60)
                    .background {
                        Image("Spline")
                            .blur(radius: 50)
                            .offset(x: 200, y: 100)
                    }
                
                VStack {
                    Spacer()
                    Text("CHAIN\nHapitify  & Planner")
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .bold()
                        .padding(.bottom , 4)
                    Text("Zincir is an app where users complete daily goals to create small links. Each completed goal adds a link, forming a strong chain over time. It helps you stay disciplined and motivated to achieve your goals.")
                        .font(.system(size: 18, weight: .light, design: .default))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .padding(.leading , 24)
                    Spacer()
                    Spacer()
                    
                    NavigationLink {
                        FirstCreateView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        RiveViewModel(fileName: "button").view()
                            .frame(width: 236 , height: 64)
                            .overlay {
                                Label("Create", systemImage: "plus")
                                    .offset(x: 4, y: 4)
                                    .font(.headline)
                            }
                            .foregroundStyle(.black)
                    }
                    .padding(.trailing ,32)

                        
                    
                    Spacer()
                }
                .padding()
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
