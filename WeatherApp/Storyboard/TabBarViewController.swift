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
        self.tabBar.items![2].badgeValue = "\(Settings.shared.favoriteCities.count)"
    }
}
