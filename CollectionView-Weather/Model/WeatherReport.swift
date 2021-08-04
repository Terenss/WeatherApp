//
//  WeatherReport.swift
//  WeatherApp
//
//  Created by Dmitrii on 22.02.2021.
//

import Foundation

final class WeatherReport: Codable {
    
    var dt: Double
    var main: WeatherMain
    var weatherInfo: [WeatherInfo]
    var dateString: String

    private enum CodingKeys: String, CodingKey {
        case dt, main, weatherInfo = "weather", dateString = "dt_txt"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.dt = try container.decode(Double.self, forKey: .dt)
        self.main = try container.decode(WeatherMain.self, forKey: .main)
        self.weatherInfo = try container.decode([WeatherInfo].self, forKey: .weatherInfo)
        self.dateString = try container.decode(String.self, forKey: .dateString)
    }
}
