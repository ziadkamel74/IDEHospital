//
//  String+Trimming.swift
//  IDEHospital
//
//  Created by Ziad on 12/17/20.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
