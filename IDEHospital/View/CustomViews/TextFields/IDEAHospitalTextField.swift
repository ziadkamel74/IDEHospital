//
//  CommonTextField.swift
//  IDEHospital
//
//  Created by Ziad on 12/16/20.
//

import UIKit

class IDEAHospitalTextField: UITextField {
    
    // MARK:- Properties
    let padding = UIEdgeInsets(top: 0, left: 53, bottom: 0, right: 0)
    
    //MARK:- Lifecycle Methods
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // MARK:- Public Methods
    func setup(leftImage: UIImage, placeholder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: ColorName.white.color, NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 15)])
        let leftIcon = UIImageView(image: leftImage)
        leftIcon.contentMode = .scaleAspectFit
        self.leftView = leftIcon
        
        self.textColor = ColorName.white.color
        self.font = FontFamily.PTSans.bold.font(size: 15)
        self.backgroundColor = .clear
        self.leftViewMode = .always
        self.layoutIfNeeded()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.height - 2, width: frame.width, height: 2)
        self.borderStyle = .none
        bottomLine.backgroundColor = ColorName.white.color.cgColor
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = true
    }
}
