//
//  Model.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 10.09.2021.
//

import Foundation

struct WeatherData: Codable {
    let lat, lon: Double?
    let daily: [Daily]?
    let timezone: String
}

// MARK: - Weather
struct Weather: Codable {
    let main: String?
    let description: String?
}

// MARK: - Daily
struct Daily: Codable {
    let timestamp: Int?
    let temp: Temp?
    let weather: [Weather]?
    let humidity: Int?
    
    private enum CodingKeys: String, CodingKey {
        case timestamp = "dt"
        case temp
        case weather
        case humidity
    }
}

// MARK: - Temp
struct Temp: Codable {
    let day: Double?  // min, max, night
    
}
