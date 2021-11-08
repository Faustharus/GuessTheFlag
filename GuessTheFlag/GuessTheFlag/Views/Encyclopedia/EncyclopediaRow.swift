//
//  EncyclopediaRow.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 07/11/2021.
//

import SwiftUI

struct EncyclopediaRow: View {
    var encyclopedia: Encyclopedia
    
    var body: some View {
        HStack {
            Image("\(encyclopedia.flagsImage)")
                .resizable()
                .frame(width: 100, height: 70)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 5, x: 0.0, y: 0.0)
            
            Spacer()
            
            VStack {
                Text("\(encyclopedia.name)")
                    .font(.headline.weight(.bold))
            }
            .padding(.all)
        }
    }
}

struct EncyclopediaRow_Previews: PreviewProvider {
    static var encyclopedia = HistoricBoard().encyclopedia
    
    static var previews: some View {
        EncyclopediaRow(encyclopedia: encyclopedia[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
