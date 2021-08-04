//
//  ResponseModel.swift
//  WeatherApp
//
//  Created by Dmitrii on 20.02.2021.
//

import Foundation

class ResponseModel: Codable {
    
    var cod: String?
    var city: City
    var message: Double
    var cnt: Double
    var list: [WeatherReport]
    
    private enum CodingKeys: CodingKey {
        case city, cod, message, cnt, list
    }
        
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(City.self, forKey: .city)
        self.cod = try container.decode(String.self, forKey: .cod)
        self.message = try container.decode(Double.self, forKey: .message)
        self.cnt = try container.decode(Double.self, forKey: .cnt)
        self.list = try container.decode([WeatherReport].self, forKey: .list)
    }
}
