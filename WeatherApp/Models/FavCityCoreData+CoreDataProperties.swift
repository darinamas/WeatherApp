//
//  FavCityCoreData+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 05.10.2021.
//
//

import Foundation
import CoreData


extension FavCityCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavCityCoreData> {
        return NSFetchRequest<FavCityCoreData>(entityName: "FavCityCoreData")
    }

    @NSManaged public var city: String?
    @NSManaged public var lat: Double
    @NSManaged public var lon: Double

}

extension FavCityCoreData : Identifiable {

}
