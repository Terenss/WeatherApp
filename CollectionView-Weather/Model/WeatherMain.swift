//
//  WeatherMain.swift
//  CollectionView-Weather
//
//  Created by Dmitrii on 01.07.2021.
//

import Foundation

class WeatherMain: Codable {
    
    var temp: Double
    
    private enum CodingKeys: CodingKey {
        case temp
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp = try container.decode(Double.self, forKey: .temp)
    }
}
