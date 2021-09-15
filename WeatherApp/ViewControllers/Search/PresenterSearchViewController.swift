//
//  PresenterSearchViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 12.09.2021.
//

import Foundation
import MapKit

class PresenterSearchViewController {
    
   weak var view: SearchViewController?
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()

}
