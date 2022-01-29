//
//  UIView+ActivityIndicator.swift
//  IDEHospital
//
//  Created by Ziad on 07/12/2020.
//

import UIKit

extension UIView {
    func showActivityIndicator() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
    }

    func hideActivityIndicator() {
        if let activityIndicator = viewWithTag(100) {
            activityIndicator.removeFromSuperview()
        }
    }
    
    func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.backgroundColor = .clear
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .whiteLarge
            // Fallback on earlier versions
        }
        activityIndicator.color = .white
        activityIndicator.tag = 100
        activityIndicator.translatesAutoresizingMaskIntoConstraints = true
        activityIndicator.center = CGPoint(x: self.frame.size.width  / 2, y: self.frame.size.height / 2)
        return activityIndicator
    }
}
