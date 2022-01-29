//
//  DoctorAppointment.swift
//  IDEHospital
//
//  Created by Ziad on 05/01/2021.
//

import Foundation

struct DoctorAppointment: Codable {
    let code: Int
    let success: Bool?
    let data: [DoctorAppointmentData]?
}

struct DoctorAppointmentData: Codable {
    let date: Int
    let times: [DoctorAppointmentTime]
}

struct DoctorAppointmentTime: Codable {
    let time: Int
    let booked: Bool
}

