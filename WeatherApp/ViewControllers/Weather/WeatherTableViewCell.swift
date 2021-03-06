//
//  WeatherCekkTableViewCell.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 11.09.2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    var main: Int?
    var indexPath: IndexPath?
    
    var weekdayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
        label.textColor = .white
        return label
    }()
    
    var humidityLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 20, width: 100, height: 50))
        label.textColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
        return label
    }()
    
    var weatherImage: UIImageView = {
       // let image =  UIImage(named: "cloud.rain")
        var imageView = UIImageView(frame: CGRect(x: 130, y: 30, width: 30, height: 30))
     //   imageView.image = image
        return imageView
    }()
    
    func setWeatherImage() -> String {
        if main == 1 {
            return "cloud.rain"
        } else {
            return "sun.max"
        }
    }
    
    var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        let a = setWeatherImage()
        weatherImage.image = UIImage(named: a)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubview() {
        addSubview(weekdayLabel)
        addSubview(humidityLabel)
        addSubview(tempLabel)
        addSubview(weatherImage)
    }
    
    func setCellUI() {
        self.backgroundColor = .black
        self.selectionStyle = .none
    }
    
    func textForLabel(label: UILabel, text: String) {
        label.text = text
    }
}
