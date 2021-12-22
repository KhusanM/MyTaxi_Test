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

//MARK: - HighlightButton

@IBDesignable
class HighlightButton: UIButton {

    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            backgroundColor = normalBackgroundColor
        }
    }

    @IBInspectable var highlightedBackgroundColor: UIColor?

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            if cornerRadius < 0 {
                layer.cornerRadius = frame.height / 2
            } else {
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    @IBInspectable var maskedCorner: CGFloat = 3 {
        didSet {
            if maskedCorner == 1 {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            } else if maskedCorner == 2 {
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else if maskedCorner == 3{
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                highlight()
            } else if oldValue == true && !isHighlighted {
                unHighlight()
            }
        }
    }

    var highlightDuration: TimeInterval = 0.25

    private func animateBackground(to color: UIColor?, duration: TimeInterval) {
        guard let color = color else { return }
        UIView.animate(withDuration: highlightDuration) {
            self.backgroundColor = color
        }
    }

    func highlight() {
        animateBackground(to: highlightedBackgroundColor, duration: highlightDuration)
    }

    func unHighlight() {
        animateBackground(to: normalBackgroundColor, duration: highlightDuration)
    }

}
