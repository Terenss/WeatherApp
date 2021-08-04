//
//  Coord.swift
//  WeatherApp
//
//  Created by Dmitrii on 20.02.2021.
//

import Foundation

class Coord: Codable {
    
    var lat: Double
    var lon: Double
    
    private enum CodingKeys : CodingKey {
        case lat, lon
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        self.lat = try container.decode(Double.self, forKey: .lat)
        self.lon = try container.decode(Double.self, forKey: .lon)
    }
}

