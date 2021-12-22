//
//  TripHistoryTVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 21.12.2021.
//

import UIKit

class TripHistoryTVC: UITableViewCell {

    static var identifier = "TripHistoryTVC"
    static func nib() -> UINib {return UINib(nibName: "TripHistoryTVC", bundle: nil)}
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderColor = #colorLiteral(red: 0.9531012177, green: 0.9531235099, blue: 0.9531114697, alpha: 1)
            containerView.layer.borderWidth = 1
            containerView.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var fromLbl: UILabel!

    @IBOutlet weak var toLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!

    @IBOutlet weak var carImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateCell(model: TripDM) {
        fromLbl.text = model.from
        toLbl.text = model.to
        timeLbl.text = model.time
        carImg.image = UIImage(named: model.img)
    }
    
}
