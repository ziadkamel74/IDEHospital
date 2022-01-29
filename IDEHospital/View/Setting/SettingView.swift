//
//  SettingView.swift
//  IDEHospital
//
//  Created by Ziad on 28/12/2020.
//

import UIKit

class SettingView: UIView {
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Public Methods
    func setup() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = ColorName.veryLightPink.color
        tableView.isScrollEnabled = false
    }
}
