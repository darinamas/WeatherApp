//
//  PresenterFavoritesVC.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 26.09.2021.
//

import UIKit
import CoreData

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

//    func fetchCoreData() {
//        if Settings.shared.firstLoad == true {
//            Settings.shared.firstLoad = false
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavCityCoreData")
//            do {
//                let results:NSArray = try context.fetch(request) as NSArray
//                for result in results {
//                    let favCity = result as! FavCityCoreData
//                    Settings.shared.favoriteCities.append(favCity) //.append(favCity)
//                    print(Settings.shared.favoriteCities)
//                }
//            } catch  {
//                print("Fetch error")
//            }
//        }
//    }
}
