//
//  City.swift
//  WeatherApp
//
//  Created by Dmitrii on 19.02.2021.
//

import Foundation

class City: Codable {
    
    var id: Double
    var name: String?
    var country: String?
    var population: Double
    var timezone: Double
    var coord: Coord?
    
    private enum CodingKeys: CodingKey {
        case id, name, country, population, timezone, coord
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Double.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(String.self, forKey: .country)
        self.population = try container.decode(Double.self, forKey: .population)
        self.timezone = try container.decode(Double.self, forKey: .timezone)
        self.coord = try container.decode(Coord.self, forKey: .coord)
    }
}
