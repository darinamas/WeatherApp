//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 09.09.2021.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var presenter = PresenterFavoritesVC()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter.view = self
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func setUI() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.shared.favoriteCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFav", for: indexPath) // as! FavoritesTableViewCell
        cell.textLabel?.text = Settings.shared.favoriteCities[indexPath.row].city
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Settings.shared.lat = Settings.shared.favoriteCities[indexPath.row].lat
        Settings.shared.lon = Settings.shared.favoriteCities[indexPath.row].lon
        Settings.shared.city = Settings.shared.favoriteCities[indexPath.row].city
        showWeatherViewController()
    }
    
    //MARK: Show Wearher view controller
    
    private func showWeatherViewController() {
        let _ = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let _ = UINavigationController(rootViewController: vc)
        show(vc, sender: nil)
    }
}
