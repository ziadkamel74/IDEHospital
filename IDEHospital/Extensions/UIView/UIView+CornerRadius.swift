//
//  UIView+CornerRadius.swift
//  IDEHospital
//
//  Created by Ziad on 12/9/20.
//

import UIKit

extension UIView {
    func setupCornerRadiuss(_ value: CGFloat? = nil, boundsClipped: Bool = true) {
        self.layer.cornerRadius = value ?? self.frame.size.height/3.5
        self.clipsToBounds = boundsClipped
    }
}
