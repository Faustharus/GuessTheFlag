//
//  HistoricBoardGame.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 05/11/2021.
//

import SwiftUI

struct HistoricBoardGame: View {
    var board: Board
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Played")
                    Text("\(board.date, formatter: dateFormatter)")
                }
                .padding(.vertical, 1)
                Text("Score : \(board.scores) / 8")
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct HistoricBoardGame_Previews: PreviewProvider {
    static var boards = Board(scores: 8)
    
    static var previews: some View {
        HistoricBoardGame(board: boards)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
