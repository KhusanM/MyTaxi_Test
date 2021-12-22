//
//  TripDetailChildVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 21.12.2021.
//

import UIKit

class TripDetailChildVC: UIViewController {

    @IBOutlet weak var carNumberContainerView: UIView! {
        didSet {
            carNumberContainerView.layer.borderWidth = 1
            carNumberContainerView.layer.borderColor = #colorLiteral(red: 0.937254902, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
            carNumberContainerView.addShadow(offset: CGSize(width: 0, height: 4), color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.02).cgColor, radius: 6, opacity: 1)
            carNumberContainerView.layer.cornerRadius = 6
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


   

}
