//
//  MyFavoriteResponse.swift
//  IDEHospital
//
//  Created by Ziad on 18/12/2020.
//

import Foundation

struct MyFavoriteResponse: Codable {
    let code: Int
    let data: MyFavoriteData?
    let success: Bool?
    let message: String?
    let errors: String?
}

struct MyFavoriteData: Codable {
    let items: [MyFavoriteItem]
    let page: Int
    let total_pages: Int
    let total: Int
}

struct MyFavoriteItem: Codable {
    let id: Int
    let rating: Int
    let reviews_count: Int
    let name: String
    let bio: String
    let second_bio: String
    let specialty: String
    let address: String
    let fees: Int
    let waiting_time: Int
    let image: String
    let city: String
    let region: String
    let is_favorited: Bool
}
