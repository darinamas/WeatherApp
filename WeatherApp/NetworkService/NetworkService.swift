//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 11.09.2021.
//

import Foundation

class NetworkService: NSObject {
    
    let apiKey = Settings.shared.apiKey
    let lat = Settings.shared.lat
    let lon = Settings.shared.lon
    
    func fetchWeather(complitionHandler: @escaping ((WeatherData)) -> ()) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            do {
                let json = try JSONDecoder().decode(WeatherData.self, from: data!)
                complitionHandler(json)
                
            } catch {
                print("Error")
            }
            
        }
        task.resume()
    }
}
