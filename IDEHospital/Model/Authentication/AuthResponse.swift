//
//  SignupResponse.swift
//  IDEHospital
//
//  Created by Ziad on 27/12/2020.
//

import Foundation

struct AuthResponse: Codable {
    let data: AuthData?
    let code: Int
    let success: Bool?
    let errors: AuthError?
    let message: String?
}

struct AuthError: Codable {
    let email: [String]?
    let voucher: [String]?
    let old_password: [String]?
}

struct AuthData: Codable {
    let id: Int?
    let email: String?
    let name: String?
    let mobile: String?
    let access_token: String?
}
