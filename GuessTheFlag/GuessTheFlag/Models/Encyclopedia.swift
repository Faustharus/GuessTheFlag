//
//  Encyclopedia.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 06/11/2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct Encyclopedia: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var capital: String
    var flagsImage: String
    var review: String
    var continent: Continent
    enum Continent: String, CaseIterable, Codable {
        case europe = "Europe"
        case america = "America"
        case asia = "Asia"
        case oceania = "Oceania"
        case africa = "Africa"
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D (
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Codable, Hashable {
        var latitude: Double
        var longitude: Double
    }
}
