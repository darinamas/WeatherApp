//
//  FavoritesTableViewCell.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 26.09.2021.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    var indexPathRow: Int?
    
    func setUI() {
        self.backgroundColor = .black
        self.textLabel?.textColor = .white
        self.detailTextLabel?.textColor = .white
        self.textLabel?.text = Settings.shared.favoriteCities[indexPathRow!].city
    }



}
