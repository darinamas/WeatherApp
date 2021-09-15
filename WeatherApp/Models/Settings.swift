//
//  SingleTon.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 10.09.2021.
//

import Foundation

class Settings {
   static var shared = Settings()

    var lat: Double = 30.033333
    var lon: Double = 31.233334
    let apiKey = "924ceecf0464f8bc2531bfd9db094bc4"
    var city: String? 
    
    var dailyWeather: [Daily]?
    
    private init() {
    }
}
