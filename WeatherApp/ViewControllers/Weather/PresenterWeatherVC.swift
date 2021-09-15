//
//  PresenterWeatherVC.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 12.09.2021.
//
import UIKit
import Foundation

class PresenterWeatheVC {
    
    weak var view: WeatherViewController?
    var networkManager = NetworkService()
    private var weather: WeatherData?
    
    //MARK: Convert and Show date
    
    func showDate(inLabel: UILabel) {
        
        let date = Settings.shared.dailyWeather![0].timestamp
        let dateU = Date(timeIntervalSince1970: Double(date!))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd. MMM YYYY"
        let strDate = dateFormatter.string(from: dateU)
        inLabel.text = strDate
    }
    
    //MARK: Show temprature
    
    func showTemp(inLabel: UILabel) {
        let temp = String(Int(round((Settings.shared.dailyWeather![0].temp?.day!)!))) + " " + " °" + "C"
        inLabel.text = temp
    }
    
    //MARK: Show main forcast
    
    func showMain(inLabel: UILabel)  {
        let main = Settings.shared.dailyWeather![0].weather![0].main
        inLabel.text = main
    }
    
    //MARK: Fetch data from API
    
    func fetchWeather(completion: @escaping ((WeatherData)) -> ()) {
        networkManager.fetchWeather { [weak self] json in
            self?.weather = json
            completion(json)
        }
    }
    
    //MARK: Return number of rows
    
    func numbeOfRows() -> Int {
        let numberRows = Settings.shared.dailyWeather?.count
        return numberRows ?? 0
    }
    
    //MARK: Convert days in selected format
    
    func showDay(indexPath: IndexPath) -> String {
        let row = indexPath.row
        let date = Settings.shared.dailyWeather![row].timestamp
        let dateU = Date(timeIntervalSince1970: Double(date!))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let strDate = dateFormatter.string(from: dateU)
        
        return strDate
    }
    
    //MARK: Customize hunidity
    
    func showHumidity(indexPath: IndexPath) -> String {
        let row = indexPath.row
        let humidity: String = String(Settings.shared.dailyWeather![row].humidity!) + " " + "%"
        
        return humidity
    }
    
    //MARK: Customize temp
    
    func showDailyTemp(indexPath: IndexPath) -> String {
        let row = indexPath.row
        let temp: String = String(Int(round((Settings.shared.dailyWeather![row].temp?.day!)!))) + " " + " °" + "C"
        return temp
    }
}
