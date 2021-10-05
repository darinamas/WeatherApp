//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 09.09.2021.
//

import UIKit
import MapKit
import CoreData

final class WeatherViewController: UIViewController {
    
    var presenter = PresenterWeatheVC()
    
    private lazy var superView = UIView()
    private lazy var topView = UIView()
    private lazy var bottomView = UIView()
    private lazy var tableView = UITableView()
    private lazy var dateLabel = UILabel()
    
    private lazy var cityLabel = UILabel()
    private lazy var tempLabel = UILabel()
    private lazy var mainLabel = UILabel() // cloudy, sunny
    private lazy var addToFavorites = AddToFavoritesButton()
    
    private lazy var city = Settings.shared.city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchWeather()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    //MARK: Fetch weather and show results
    
    private func fetchWeather() {
        presenter.fetchWeather { json in
            DispatchQueue.main.async { [self] in
                Settings.shared.dailyWeather = json.daily
                showTopViewData()
                tableView.reloadData()
            }
        }
    }
    
    private func setUI() {
        translateIntpConstraints()
        setupView()
        addConstraints()
        setTableView()
        setLabelsStyle()
        setupButtonAddToFav()
    }
    
    private func translateIntpConstraints() {
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
    }
    
    //MARK: Add subviews
    
    private  func setupView() {
        view.addSubview(superView)
        superView.addSubview(topView)
        superView.addSubview(tableView)
        superView.addSubview(bottomView)
        topView.addSubview(dateLabel)
        topView.addSubview(cityLabel)
        topView.addSubview(tempLabel)
        topView.addSubview(mainLabel)
        bottomView.addSubview(addToFavorites)
        tableView.backgroundColor = .black
        bottomView.backgroundColor = .black
        topView.backgroundColor = .black
        
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
            dateLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.1),
            
            cityLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 40),
            cityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            cityLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7),
            cityLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.11),
            
            tempLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 40),
            tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 30),
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
    
    private func setLabelsStyle() {
        
        dateLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        cityLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        cityLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        tempLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        tempLabel.font = UIFont.boldSystemFont(ofSize: 64)
        mainLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        mainLabel.font = UIFont.systemFont(ofSize: 64)
    }
    
    private func showTopViewData() {
        presenter.showDate(inLabel: dateLabel)
        presenter.showTemp(inLabel: tempLabel)
        presenter.showMain(inLabel: mainLabel)
        cityLabel.text = Settings.shared.city
    }
    
    private func setupButtonAddToFav() {
        addToFavorites.addTarget(self, action: #selector(self.favButtonAction), for: UIControl.Event.touchUpInside)
    }
    
    //MARK: User tapped on the fav button.

    @objc func favButtonAction() {
        presenter.appendCityToFavCity()
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "FavCityCoreData", in: context)
//        let newNote = FavCityCoreData(entity: entity!, insertInto: context)
//        newNote.city = Settings.shared.city!
//        newNote.lon = String(Settings.shared.lon)
//        newNote.lat = String(Settings.shared.lat)
//
//        do {
//            try context.save()
//            Settings.shared.favoriteCities.append(newNote)
//            print(Settings.shared.favoriteCities)
//        } catch  {
//            print("Error")
//        }
        
        addToFavorites.disableButton()

        //Badge update on the tab bar item.
        if let tabVC = self.tabBarController as? TabBarViewController {
            tabVC.itemBadgeDisplay()
        }
    }
    
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numbeOfRows() 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.setCellUI()
        cell.textForLabel(label: cell.weekdayLabel, text: presenter.showDay(indexPath: indexPath))
        cell.textForLabel(label: cell.humidityLabel, text: presenter.showHumidity(indexPath: indexPath))
        cell.textForLabel(label: cell.tempLabel, text: presenter.showDailyTemp(indexPath: indexPath))
        cell.tempLabel.frame = CGRect(x: tableView.frame.maxX - tableView.frame.maxX/6, y: 20, width: 50, height: 50)
        cell.humidityLabel.frame = CGRect(x: tableView.frame.maxX/2, y: 20, width: 50, height: 50)
        cell.main = presenter.whatMain(indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return tableView.frame.size.height/9
    }
    
    //MARK: Set Table View
    private  func setTableView() {
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.isScrollEnabled = false
    }
    
    
}









