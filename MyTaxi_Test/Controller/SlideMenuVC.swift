//
//  SlideMenuVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 20.12.2021.
//

import UIKit

protocol SlideMenuDelegate {
    func pushToTripHistoryVC()
}

class SlideMenuVC: UIViewController {

    var delegate: SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

    @IBAction func myTripsBtnTapped(_ sender: Any) {
        delegate?.pushToTripHistoryVC()
        self.sideMenuViewController?.hideMenuViewController()
    }
    
    
}
