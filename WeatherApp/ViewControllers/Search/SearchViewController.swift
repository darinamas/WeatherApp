//
//  SearchTESTViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 13.09.2021.
//

import UIKit
import MapKit

class SearchViewController: UIViewController, UISearchBarDelegate, MKLocalSearchCompleterDelegate {
    
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTable: UITableView!
    var presenter = PresenterSearchViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.searchCompleter.delegate = self
        searchBar?.delegate = self
        searchResultsTable?.delegate = self
        searchResultsTable?.dataSource = self
        setUI()
    }
    
   private func setUI() {
        searchResultsTable.separatorStyle = .none
        searchResultsTable.backgroundColor = .black
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = presenter.searchResults[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        searchRequest(indexPath: indexPath, searchResults: presenter.searchResults)
    }
}

extension SearchViewController {
    
    //MARK: Search text changed
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.searchCompleter.queryFragment = searchText
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        presenter.searchResults = completer.results
        searchResultsTable.reloadData()
    }
    
   //MARK: Returned coordinates of the selected city from the search
    
  private func searchRequest(indexPath: IndexPath, searchResults: [MKLocalSearchCompletion])  {
        let result = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: result)
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else {return}
            guard let name = response?.mapItems[0].name else {return}
            Settings.shared.lat = coordinate.latitude
            Settings.shared.lon = coordinate.longitude
            Settings.shared.city = name
            self.showWeatherViewController()
          
        }
    }
    
    //MARK: Show Wearher view controller
    
    private func showWeatherViewController() {
        let _ = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let _ = UINavigationController(rootViewController: vc)
        show(vc, sender: nil)
    }
}
