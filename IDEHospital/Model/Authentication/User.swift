//
//  User.swift
//  IDEHospital
//
//  Created by Ziad on 27/12/2020.
//

import Foundation

struct User: Codable {
    let name: String?
    let email: String?
    let mobile: String?
    let password: String?
    let old_password: String?
    
    init(name: String? = nil, email: String?, mobile: String? = nil, password: String? = nil, oldPassword: String? = nil) {
        self.name = name
        self.email = email
        self.mobile = mobile
        self.password = password
        self.old_password = oldPassword
    }
}
