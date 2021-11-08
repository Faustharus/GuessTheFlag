//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 03/11/2021.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    @StateObject var historicBoard = HistoricBoard()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(HistoricBoard())
            }
        }
    }
}
