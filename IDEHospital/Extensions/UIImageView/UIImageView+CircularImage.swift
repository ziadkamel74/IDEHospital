//
//  UIImageView+CircularImageBorder.swift
//  IDEHospital
//
//  Created by Ziad on 07/12/2020.
//

import UIKit

extension UIImageView {
    func circularImageView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorName.darkRoyalBlue.color.cgColor
    }
}
