//
//  RequestData.swift
//  IDEHospital
//
//  Created by Ziad on 12/22/20.
//

import Foundation

struct RequestData: Codable {
    let name: String?
    let email: String?
    let mobile: String?
    let message: String?
}

struct RequestResponse: Codable {
    let code: Int
    let success: Bool
}
