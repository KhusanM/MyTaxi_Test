//
//  TripDetailVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 21.12.2021.
//

import UIKit
import GoogleMaps
import CoreLocation

class TripDetailVC: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var dismissBtn: UIButton! {
        didSet {
            dismissBtn.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, radius: 10, opacity: 1)
            dismissBtn.layer.cornerRadius = 18
        }
    }
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forMapView()
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false) { _ in
            self.forChildVC()
        }
    }

    func forMapView() {
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
    
    func forChildVC() {
        let vc = TripDetailChildVC(nibName: "TripDetailChildVC", bundle: nil)
        if #available(iOS 15.0, *) {
            vc.isModalInPresentation = true
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.preferredCornerRadius = 18
            }
            present(vc, animated: true, completion: nil)
        } else {
            present(vc, animated: true, completion: nil)
        }
        
    }

    @IBAction func dismissBtnTapped(_ sender: Any) {
        dismiss(animated: false) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

//MARK: - Location Manager Delegate
extension TripDetailVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)

        self.mapView?.animate(to: camera)

        self.locationManager.stopUpdatingLocation()

    }
}
