//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 09.09.2021.
//

import UIKit

class FavoritesViewController: UIViewController {
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
    
    //MARK: Show Wearher view controller
    
    private func showWeatherViewController() {
        let _ = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let _ = UINavigationController(rootViewController: vc)
        show(vc, sender: nil)
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFav", for: indexPath) as! FavoritesTableViewCell
        cell.indexPathRow = indexPath.row
        cell.setUI()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.transferData(indexPath: indexPath)
        showWeatherViewController()
    }
    
}
