//
//  Extention.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 20.12.2021.
//

import UIKit

//MARK: - AddShadow to View
extension UIView {
    
    func addShadow(offset: CGSize, color: CGColor, radius: CGFloat, opacity: Float){
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color
    }
}

//MARK: - Add corner radius to ViewController
extension UIView {
    func makeCorner(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.isOpaque = false
    }
}
