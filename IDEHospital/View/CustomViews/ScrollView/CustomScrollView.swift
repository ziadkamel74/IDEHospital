//
//  CustomScrollView.swift
//  IDEHospital
//
//  Created by Ziad on 30/12/2020.
//

import UIKit

class CustomScrollView: UIScrollView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isDragging {
            self.endEditing(true)
        } else {
            super.touchesBegan(touches, with: event)
        }
    }
}
