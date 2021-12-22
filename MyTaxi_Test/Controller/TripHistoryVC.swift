//
//  TripHistoryVC.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 20.12.2021.
//

import UIKit
import SnapKit

class TripHistoryVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(TripHistoryTVC.nib(), forCellReuseIdentifier: TripHistoryTVC.identifier)
            if #available(iOS 15.0, *) {
                tableView.sectionHeaderTopPadding = 0
            }
        }
    }
    
    var tripData:[TripHistoryDM] = [
        TripHistoryDM(date: "6 Июля, Вторник", trips: [
            TripDM(from: "улица Sharof Rashidov, Ташкент", to: "5a улица Асадуллы Ходжаева", img: "deliveryCar", time: "21:36 - 22:12"),
            TripDM(from: "улица Sharof Rashidov, Ташкент", to: "5a улица Асадуллы Ходжаева", img: "comfortCar", time: "14:40 - 15:00"),
            TripDM(from: "улица Sharof Rashidov, Ташкент", to: "5a улица Асадуллы Ходжаева", img: "businesCar", time: "12:00 - 12:19")]),
        TripHistoryDM(date: "5 Июля, Понедельник", trips: [
            TripDM(from: "улица Sharof Rashidov, Ташкент", to: "5a улица Асадуллы Ходжаева", img: "deliveryCar", time: "21:36 - 22:12"),
            TripDM(from: "улица Sharof Rashidov, Ташкент", to: "5a улица Асадуллы Ходжаева", img: "comfortCar", time: "14:40 - 15:00"),
            TripDM(from: "улица Sharof Rashidov, Ташкент", to: "5a улица Асадуллы Ходжаева", img: "businesCar", time: "12:00 - 12:19")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigation()
    }


   
}

//MARK: - Table View
extension TripHistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripData[section].trips.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TripHistoryTVC.identifier, for: indexPath) as? TripHistoryTVC else {return UITableViewCell()}
        
        if !tripData.isEmpty {
            cell.selectionStyle = .none
            cell.updateCell(model: tripData[indexPath.section].trips[indexPath.row])
        }
        
        return cell
    }
                            
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if !tripData.isEmpty {
            let label = UILabel()
            label.backgroundColor = .clear
            label.text = tripData[section].date
            label.textColor = #colorLiteral(red: 0.3321701288, green: 0.3321786821, blue: 0.3321741223, alpha: 1)
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)

            let containerView = UIView()
            containerView.addSubview(label)
            containerView.backgroundColor = .white

            label.snp.makeConstraints { make in
                make.bottom.equalTo(0)
                make.left.equalTo(16)
                make.right.equalTo(-15)
                make.top.equalTo(0)
            }
            return containerView
        }
        return UIView()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TripDetailVC(nibName: "TripDetailVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

//MARK: - Navigation
extension TripHistoryVC {
    func initNavigation() {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "arrow.left")

        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: navigationBar.frame.width/8, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
           
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "Мои поездки"
            firstLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            
            navigationBar.addSubview(firstLabel)
            
        }
    }
    
}
