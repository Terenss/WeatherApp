//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Dmitrii on 22.02.2021.
//

import Foundation

class WeatherInfo: Codable {
    
    var iconName: String
    
    private enum CodingKeys: String, CodingKey{
        case iconName = "main"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.iconName = try container.decode(String.self, forKey: .iconName)
    }
}
