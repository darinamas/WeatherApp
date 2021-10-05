//
//  PresenterMapVC.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 13.09.2021.
//
import MapKit
import UIKit
import CoreData

class PresenterMapVC {
    weak var view: MapViewController?
    
    //MARK: Convert coordinates to City - reverse geocoding
    
     func convertToCity() {
        let location = CLLocation(latitude: Settings.shared.lat,
                                  longitude: Settings.shared.lon)
        
        location.fetchCity { city, error in
            guard let city = city, error == nil else { return }
            Settings.shared.city = city
            
        }
    }
    
    func fetchCoreData() {
        if Settings.shared.firstLoad == true {
            Settings.shared.firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavCityCoreData")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let favCity = result as! FavCityCoreData
                    Settings.shared.favoriteCities.append(favCity) //.append(favCity)
                    print(Settings.shared.favoriteCities)
                }
            } catch  {
                print("Fetch error")
            }
        }
    }
    

   
}
