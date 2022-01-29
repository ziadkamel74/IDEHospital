//
//  MainCategoriesResponse.swift
//  IDEHospital
//
//  Created by Ziad on 10/12/2020.
//

import Foundation

struct MainCategoriesResponse: Codable {
    let data: [MainCategoriesData]
}

struct MainCategoriesData: Codable {
    let id: Int
    let name, image, color: String
}
