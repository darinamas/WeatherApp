//
//  PresenterMapVC.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 13.09.2021.
//
import MapKit
import UIKit

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
    

   
}
