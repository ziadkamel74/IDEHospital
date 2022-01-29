//
//  Review.swift
//  IDEHospital
//
//  Created by Ziad on 1/4/21.
//

import Foundation

struct Review {
    let doctorID: Int
    var rating: Int?
    var comment: String?
    
    func parameters() -> [String: Any] {
        var params = [String: Any]()
        params[ParameterKeys.rating] = rating
        params[ParameterKeys.comment] = comment
        return params
    }
}
