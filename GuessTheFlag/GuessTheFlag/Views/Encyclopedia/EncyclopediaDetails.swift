//
//  EncyclopediaDetails.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 07/11/2021.
//

import SwiftUI

struct EncyclopediaDetails: View {
    @EnvironmentObject var historicBoard: HistoricBoard
    var encyclopedia: Encyclopedia
    
    var body: some View {
        ZStack {
            // Background
            VStack {
                MapView(coordinate: encyclopedia.locationCoordinate)
                    .frame(maxWidth: 400, maxHeight: 300)
                    .overlay(
                        ZStack(alignment: .bottomTrailing) {
                            Rectangle().foregroundColor(.clear)
                            VStack {
                                Image("\(encyclopedia.flagsImage)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                            }
                        }
                    )
                    .ignoresSafeArea(edges: .top)
                
                Spacer()
                
                Section(header: Text("COUNTRY:").font(.headline.weight(.medium))) {
                    Text("\(encyclopedia.name)")
                        .font(.title.weight(.bold))
                        .shadow(color: .white, radius: 1, x: -5.0, y: 5.0)
                }
                
                ZStack {
                    Rectangle().foregroundColor(.clear)
                        .frame(maxHeight: 50)
                    HStack {
                        Text("CAPITAL: \(encyclopedia.capital)")
                        Text("|")
                        Text("CONTINENT: \(encyclopedia.continent.rawValue)")
                    }
                    .font(.headline.weight(.bold))
                }
                
                Section(header: Text("DETAILS:").font(.headline.weight(.bold)).underline()) {
                    ScrollView {
                        Text("\(encyclopedia.review)")
                            .font(.headline)
                            .layoutPriority(1)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(maxWidth: 350)
                .padding(.vertical, 10)
            }
        }
    }
}

struct EncyclopediaDetails_Previews: PreviewProvider {
    static var previews: some View {
        EncyclopediaDetails(encyclopedia: HistoricBoard().encyclopedia[16])
            .environmentObject(HistoricBoard())
    }
}
