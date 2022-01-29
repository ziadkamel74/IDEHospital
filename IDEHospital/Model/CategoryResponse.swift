//
//  CategoryData.swift
//  IDEHospital
//
//  Created by Ziad on 12/10/20.
//

import Foundation

struct CategoryResponse: Codable {
    let success: Bool
    let code: Int
    let data: CategoryData
}

struct CategoryData: Codable {
    let specialties: [Specialty]
    let cities: [City]
    let companies: [Company]
}

struct Specialty: Codable {
    let id: Int
    let name: String
}

struct City: Codable {
    let id: Int
    let name: String
    let regions: [Region]
}

struct Region: Codable, Equatable {
    let id: Int
    let name: String
}

struct Company: Codable {
    let id: Int
    let name: String
}
