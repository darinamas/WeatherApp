//
//  TESTViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 14.09.2021.
//

import UIKit

class TESTViewController: UIViewController {

    private lazy var superView = UIView()
    private lazy var topView = UIView()
    private lazy var bottomView = UIView()
    private lazy var tableView = UITableView()
    
    
    private lazy var dateLabel = UILabel()
    
    private lazy var cityLabel = UILabel()
    private lazy var tempLabel = UILabel()
    private lazy var mainLabel = UILabel() // cloudy, sunny
    private lazy var addToFavorites = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        superView.translatesAutoresizingMaskIntoConstraints = false
        superView.frame = .zero
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.frame = .zero
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = .zero
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.frame = .zero
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.frame = .zero
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.frame = .zero
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.frame = .zero
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.frame = .zero
        
        addToFavorites.translatesAutoresizingMaskIntoConstraints = false
        addToFavorites.frame = .zero
        
        setupView()
        addConstraints()
        // Do any additional setup after loading the view.
    }
    
    private  func setupView() {
        superView.backgroundColor = .blue
        view.addSubview(superView)
        topView.backgroundColor = .systemPink
        superView.addSubview(topView)
       
        superView.addSubview(tableView)
        superView.addSubview(bottomView)
        bottomView.backgroundColor = .brown
        
        topView.addSubview(dateLabel)
        dateLabel.backgroundColor = .green
        
        topView.addSubview(cityLabel)
        cityLabel.backgroundColor = .darkGray
        
        topView.addSubview(tempLabel)
        tempLabel.backgroundColor = .blue
       
        topView.addSubview(mainLabel)
        mainLabel.backgroundColor = .link
        
        bottomView.addSubview(addToFavorites)
        addToFavorites.backgroundColor = .link
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            superView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            superView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            superView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            superView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            topView.leftAnchor.constraint(equalTo: superView.leftAnchor),
            topView.rightAnchor.constraint(equalTo: superView.rightAnchor),
            topView.topAnchor.constraint(equalTo: superView.topAnchor),
            topView.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: 0.38),
            
            tableView.leftAnchor.constraint(equalTo: superView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: superView.rightAnchor),
            tableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            tableView.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: 0.48),
            
            bottomView.leftAnchor.constraint(equalTo: superView.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: superView.rightAnchor),
            bottomView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            
            dateLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 40),
            dateLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7),
            dateLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.18),
            
            cityLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 40),
            cityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            cityLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7),
            cityLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.18),
            
            tempLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 40),
            tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            tempLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7),
            tempLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.3),
            
            mainLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 40),
            mainLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            mainLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7),
            mainLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            
            
            addToFavorites.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 40),
            addToFavorites.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
            addToFavorites.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.7),
            addToFavorites.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.3),
            
        ])
    
            }
    


}
