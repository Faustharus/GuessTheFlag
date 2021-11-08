//
//  EncyclopediaView.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 06/11/2021.
//

import SwiftUI

struct EncyclopediaView: View {
    @EnvironmentObject var historicBoard: HistoricBoard
    
    //    init() {
    //        UITableView.appearance().backgroundColor = .clear
    //        UITableViewCell.appearance().backgroundColor = .clear
    //    }
    
    var body: some View {
        ZStack {
            //Background
            List {
                ForEach(historicBoard.encyclopedia) { item in
                    NavigationLink(destination: EncyclopediaDetails(encyclopedia: item)) {
                        EncyclopediaRow(encyclopedia: item)
                    }
                }
            }
        }
    }
}

struct EncyclopediaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EncyclopediaView()
                .environmentObject(HistoricBoard())
        }
    }
}
