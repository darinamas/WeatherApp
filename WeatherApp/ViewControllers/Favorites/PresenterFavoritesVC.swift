//
//  PresenterFavoritesVC.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 26.09.2021.
//

import UIKit

class PresenterFavoritesVC {

    weak var view: FavoritesViewController?
    
    func numberOfCities() -> Int {
        Settings.shared.favoriteCities.count
    }
    
    func transferData(indexPath: IndexPath) {
        Settings.shared.lat = Settings.shared.favoriteCities[indexPath.row].lat
        Settings.shared.lon = Settings.shared.favoriteCities[indexPath.row].lon
        Settings.shared.city = Settings.shared.favoriteCities[indexPath.row].city
    }

}
