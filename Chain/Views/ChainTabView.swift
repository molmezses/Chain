//
//  ChainTabView.swift
//  Chain
//
//  Created by Mustafa Ölmezses on 27.02.2025.
//

import SwiftUI

struct ChainTabView: View {
    var body: some View {
        TabView {
            ChainListView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock.fill")
                        Text("Today")
                    }
                }
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.rectangle.fill")
                        Text("Chains")
                    }
                }
            CalendarView()
                .tabItem {
                    VStack {
                        Image(systemName: "align.vertical.bottom.fill")
                        Text("Stats")
                    }
                }
            FirstCreateView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
        }
        .tint(.indigo)
    }
}

#Preview {
    ChainTabView()
}
