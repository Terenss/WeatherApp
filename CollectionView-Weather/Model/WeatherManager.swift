//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Dmitrii on 09.01.2021.
//

import Foundation
import CoreLocation

struct WeatherManager {
    
    let baseURL = "https://api.openweathermap.org/data/2.5/forecast?appid=b55174293bc04b637df2b71c2888e9fd&units=metric"
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(baseURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func finalString(cityName: String) {
        let urlString: String = ("\(baseURL)&q=\(cityName)")
        performRequest(with: urlString)
        print(urlString)
    }
    
    func performRequest(with urlString: String, completion: ((_ data: Data?, _ response: URLResponse?, _ error: Error?) -> (Void))? = nil) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create URL Session
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            var task: URLSessionDataTask?
            
            if let completion = completion {
                task = session.dataTask(with: url, completionHandler: completion)
            } else {
                task = session.dataTask(with: url)
            }
            
            //4. Start the task
            
            task?.resume()
        }
    }        
}


