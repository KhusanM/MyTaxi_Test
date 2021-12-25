//
//  MainVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 19.12.2021.
//

import UIKit
import GoogleMaps
import AKSideMenu
import CoreLocation


class MainVC: UIViewController {

    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var hamburgerBtn: UIButton! {
        didSet {
            hamburgerBtn.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, radius: 10, opacity: 1)
            hamburgerBtn.layer.borderWidth = 1.5
            hamburgerBtn.layer.borderColor = #colorLiteral(red: 0.8990570903, green: 0.8990781903, blue: 0.8990668654, alpha: 1)
            hamburgerBtn.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var addressContainerView: UIView! {
        didSet {
            addressContainerView.layer.cornerRadius = 14
            addressContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    @IBOutlet weak var whereFromBtn: HighlightButton!
    
    @IBOutlet weak var addressStackView: UIStackView! {
        didSet {
            addressStackView.layer.cornerRadius = 12
            addressStackView.clipsToBounds = true
        }
    }
    
    let geocoder = GMSGeocoder()
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        self.view.makeCorner(withRadius: 20)
        forMapView()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    func forMapView() {
        self.mapView?.isMyLocationEnabled = true
        self.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
    
    func getLocationName(lat: Double, lon: Double) {
        
        let position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        geocoder.reverseGeocodeCoordinate(position) { response, error in
            
            if error != nil {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            } else {
                if let places = response?.results() {
                    if let place = places.first {
                        if let lines = place.lines {
                            self.whereFromBtn.setTitle(lines.first ?? "Aniqlanmadi", for: .normal)
                        }
                    } else {
                        print("GEOCODE: nil first in places")
                    }
                } else {
                    print("GEOCODE: nil in places")
                }
            }
        }
    }
    
    @IBAction func hamburgerBtnTapped(_ sender: Any) {
        self.sideMenuViewController?.contentViewScaleValue = 0.8
        self.sideMenuViewController?.contentViewInPortraitOffsetCenterX = CGFloat(UIScreen.main.bounds.width * 0.25)
        
        self.sideMenuViewController?.bouncesHorizontally = false
        
        let vc = SlideMenuVC(nibName: "SlideMenuVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        sideMenuViewController?.delegate = self
        self.sideMenuViewController?.presentLeftMenuViewController()
    }
    
    @IBAction func locationBtnTapped(_ sender: Any) {
        mapView.moveCamera(GMSCameraUpdate.setTarget(CLLocationCoordinate2D(latitude: (mapView.myLocation?.coordinate.latitude)!, longitude: (mapView.myLocation?.coordinate.longitude)!), zoom: 17))
    }
    

}

//MARK: - GMSMapViewDelegate
extension MainVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        getLocationName(lat: mapView.camera.target.latitude, lon: mapView.camera.target.longitude)
    }
    
    
}

//MARK: - Location Manager Delegate
extension MainVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)

        self.mapView?.animate(to: camera)

        self.locationManager.stopUpdatingLocation()

    }
    
    
}

extension MainVC: SlideMenuDelegate {
    func pushToTripHistoryVC() {
        
        
    }
}

extension MainVC: AKSideMenuDelegate {

    open func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        let vc = TripHistoryVC(nibName: "TripHistoryVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
