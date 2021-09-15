//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Daryna Polevyk on 09.09.2021.
//
import MapKit
import UIKit

class MapViewController: UIViewController {
    
    private let map: MKMapView = MKMapView()
    var coordinate: CLLocationCoordinate2D?
    var presenter = PresenterMapVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        view.addSubview(map)
        map.delegate = self
        getUserLocation()
        setLongTap()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
    
    private func setLongTap() {
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(mapViewTapped))
        map.addGestureRecognizer(longTap)
    }
    
    
    //MARK: Set pin after long tap
    @objc func mapViewTapped(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: map)
        self.coordinate = coordinate
        let pin = MKPointAnnotation()
        
        pin.coordinate = coordinate
        map.setRegion(
            MKCoordinateRegion(center: pin.coordinate,
                               span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)),
            animated: true)
        map.addAnnotation(pin)
    }
    
    
    //MARK: Get user location and set the pin on the map
    
    private func getUserLocation () {
        LocationService.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async { [self] in
                guard let strongSelf = self else {return}
                let pin = MKPointAnnotation()
                pin.coordinate = location.coordinate
                self!.coordinate = location.coordinate
                strongSelf.map.setRegion(
                    MKCoordinateRegion(center: location.coordinate,
                                       span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)),
                    animated: true)
                strongSelf.map.addAnnotation(pin)
            }
        }
    }
    
    
    //MARK: Show weather view Controller
    
    private func showWeatherViewController() {
        let _ = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let _ = UINavigationController(rootViewController: vc)
        show(vc, sender: nil)
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        Settings.shared.lat = coordinate!.latitude
        Settings.shared.lon = coordinate!.longitude
        presenter.convertToCity()
        self.showWeatherViewController()
    }
}

extension CLLocation {
    
    func fetchCity(completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $1) }
    }
}
