//
//  HistoricBoard.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 05/11/2021.
//

import Foundation
import Combine

final class HistoricBoard: ObservableObject {
    @Published var encyclopedia: [Encyclopedia] = load("countries.json")
    @Published var boardScore: [Board] = [] {
        didSet {
            saveScore()
        }
    }
    let boardKeys: String = "scoreKeys"
    
    init() {
        getScores()
    }
    
    func getScores() {
        guard
            let data = UserDefaults.standard.data(forKey: boardKeys),
            let savedScores = try? JSONDecoder().decode([Board].self, from: data)
        else {
            return
        }
        self.boardScore = savedScores
    }
    
    func addScores(scores: Int) {
        let newScore = Board(scores: scores)
        boardScore.append(newScore)
    }
    
    func saveScore() {
        if let encoded = try? JSONEncoder().encode(boardScore) {
            UserDefaults.standard.set(encoded, forKey: boardKeys)
        }
    }
    
    func deleteScore(indexSet: IndexSet) {
        boardScore.remove(atOffsets: indexSet)
    }
    
    func emptyBoard() {
        boardScore.removeAll()
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in the bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}
