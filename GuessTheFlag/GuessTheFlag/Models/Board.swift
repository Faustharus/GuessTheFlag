//
//  Board.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 05/11/2021.
//

import Foundation

struct Board: Identifiable, Codable, Hashable {
    var id: String = UUID().uuidString
    var scores: Int
    var date = Date()
}
