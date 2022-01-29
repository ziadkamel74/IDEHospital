//
//  File.swift
//  IDEHospital
//
//  Created by Ziad on 04/01/2021.
//

import Foundation

struct Doctor: Codable {
    let success: Bool?
    let code: Int
    let data: DoctorData?
}

struct DoctorData: Codable {
    let id: Int
    let rating: Int
    let reviews_count: Int
    let specialty: String
    let name: String
    let bio: String
    let second_bio: String
    let address: String
    let lng: Double
    let lat: Double
    let fees: Int
    let waiting_time: Int
    let image: String
    let companies: [String]
    let is_favorited: Bool
}
