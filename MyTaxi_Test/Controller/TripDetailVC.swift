//
//  TripDetailVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 21.12.2021.
//

import UIKit
import GoogleMaps

class TripDetailVC: UIViewController {

    @IBOutlet weak var mapView: UIView!
    
    @IBOutlet weak var dismissBtn: UIButton! {
        didSet {
            dismissBtn.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, radius: 10, opacity: 1)
            dismissBtn.layer.cornerRadius = 18
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forMapView()
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false) { _ in
            self.forChildVC()
        }
    }

    func forMapView(){
        let map = GMSMapView(frame: UIScreen.main.bounds, camera: GMSCameraPosition(latitude: 41.311081, longitude: 69.240562, zoom: 15))
        mapView.addSubview(map)
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
            print("as")
            present(vc, animated: true, completion: nil)
        } else {
        }
        
    }

    @IBAction func dismissBtnTapped(_ sender: Any) {
        dismiss(animated: false) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
