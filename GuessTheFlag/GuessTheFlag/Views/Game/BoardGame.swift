//
//  BoardGame.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 05/11/2021.
//

import SwiftUI

struct BoardGame: View {
    
    @EnvironmentObject var historicBoard: HistoricBoard
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack {
                Text("Score Board")
                    .font(.largeTitle.weight(.bold))
            }
            
            Spacer()
            
            List {
                ForEach(historicBoard.boardScore) { score in
                    HistoricBoardGame(board: score)
                }
                .onDelete(perform: historicBoard.deleteScore)
            }
            HStack {
                Button("Close", role: .cancel) {
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Delete All", role: .destructive) {
                    historicBoard.emptyBoard()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct BoardGame_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BoardGame()
                .environmentObject(HistoricBoard())
        }
        .navigationBarHidden(true)
    }
}
