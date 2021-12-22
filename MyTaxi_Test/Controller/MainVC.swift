//
//  MainVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 19.12.2021.
//

import UIKit
import GoogleMaps
import AKSideMenu

class MainVC: UIViewController {

    
    @IBOutlet weak var mapView: UIView!
    
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
    
    @IBOutlet weak var addressStackView: UIStackView! {
        didSet {
            addressStackView.layer.cornerRadius = 12
            addressStackView.clipsToBounds = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        self.view.makeCorner(withRadius: 20)
        //forMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    func forMapView(){
        let map = GMSMapView(frame: UIScreen.main.bounds, camera: GMSCameraPosition(latitude: 41.311081, longitude: 69.240562, zoom: 15))
        mapView.addSubview(map)
    }

    @IBAction func hamburgerBtnTapped(_ sender: Any) {
        self.sideMenuViewController?.contentViewScaleValue = 0.8
        self.sideMenuViewController?.contentViewInPortraitOffsetCenterX = 115
        
        self.sideMenuViewController?.bouncesHorizontally = false
        
        let vc = SlideMenuVC(nibName: "SlideMenuVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        sideMenuViewController?.delegate = self
        self.sideMenuViewController?.presentLeftMenuViewController()
    }
    
    @IBAction func locationBtnTapped(_ sender: Any) {
        
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
