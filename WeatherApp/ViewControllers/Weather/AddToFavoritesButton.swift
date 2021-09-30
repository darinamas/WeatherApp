//
//  AddToFavoritesButton.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 30.09.2021.
//

import UIKit

class AddToFavoritesButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton() {
        self.setTitle("Add to favorites", for: .normal)
        self.setTitleColor(UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0), for: .normal)
        self.titleLabel!.font = UIFont(name: "System Semibold" , size: 25)
        self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
    
    }

}
