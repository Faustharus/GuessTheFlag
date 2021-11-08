//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 03/11/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var historicBoard: HistoricBoard
    
    @State private var selection: Tab = .game
    
    @State private var isVisible: Bool = false
    
    enum Tab {
        case game, encyclopedia
    }
    
    var body: some View {
        TabView(selection: $selection) {
            GameView()
                .tabItem {
                    Label("Game", systemImage: "gamecontroller")
                }
                .tag(Tab.game)
            
            EncyclopediaView()
                .tabItem {
                    Label("Encyclopedia", systemImage: "book.closed")
                }
                .tag(Tab.encyclopedia)
        }
        .navigationTitle("Guess The Flag")
        .navigationBarTitleDisplayMode(.inline)
        .popover(isPresented: $isVisible) {
            BoardGame()
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Image(systemName: "list.bullet")
                    .foregroundColor(.white)
                    .onTapGesture {
                        isVisible.toggle()
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(HistoricBoard())
        }
    }
}
