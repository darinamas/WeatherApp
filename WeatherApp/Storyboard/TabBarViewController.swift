//
//  TabBarViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 30.09.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        itemBadgeDisplay()
        
    }
    
    //MARK: Assign number of items in the Favorite list to the badge on the fav tab bar.
    
    func itemBadgeDisplay() {
        let countFavCities = String(Settings.shared.favoriteCities.count)
        self.tabBar.items![2].badgeValue = countFavCities
    }
}
